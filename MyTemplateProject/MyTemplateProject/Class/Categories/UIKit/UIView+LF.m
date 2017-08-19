//
//  UIView+lf.m
//  YDT
//
//  Created by lf on 15/6/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "UIView+LF.h"
#import <objc/runtime.h>
#import "FXBlurView.h"

static char kDTActionHandlerTapBlockKey;
static char kDTActionHandlerTapGestureKey;
static char kDTActionHandlerLongPressBlockKey;
static char kDTActionHandlerLongPressGestureKey;
static char KDTActionHandlerSwipeBlockKey;
static char KDTActionHandlerSwipeGestureKey;

@implementation UIView (LF)

/**
 *  初始化
 *
 *  @param rect      大小
 *  @param backColor 背景颜色
 *
 *  @return 实例
 */
+ (UIView *)lf_viewWithFrame:(CGRect)rect backColor:(UIColor *)backColor
{
    UIView *view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = backColor;
    return view;
}

/**
 *  将视图转为图片
 *
 *  @return 图片
 */
- (UIImage *)lf_toImage {
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/**
 *  拨打电话号码，弹出提示框
 *
 *  @param phoneNumber 电话号码
 *  @param view        指定视图
 */
- (void)telWithPhoneNumber:(NSString *)phoneNumber {
    NSString *str = [NSString stringWithFormat:@"tel:%@", phoneNumber];
    UIWebView *callWebview = [[UIWebView alloc] init];
    callWebview.delegate = self;
    [callWebview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [self addSubview:callWebview];
}

#pragma mark - UIWebViewDelegate

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    DDLogError(@"call Phone error = %@",error);
}

/**
 *  重设x起点
 *
 *  @param x        新的x坐标
 *  @param animated 是否允许动画
 */
- (void)lf_resetOriginX:(float)x animated:(BOOL)animated {
    CGRect rect = self.frame;
    rect.origin.x = x;
    
    if (animated) {
        [UIView animateWithDuration:0.3 animations:^{
            self.frame = rect;
        }];
    }
    else {
        self.frame = rect;
    }
}

/**
 *  重设y起点
 *
 *  @param y        新的y坐标
 *  @param animated 是否允许动画
 */
- (void)lf_resetOriginY:(float)y animated:(BOOL)animated {
    CGRect rect = self.frame;
    rect.origin.y = y;
    
    if(animated) {
        [UIView animateWithDuration:0.3 animations:^{
            self.frame = rect;
        }];
    }
    else {
        self.frame = rect;
    }
}


@end


#pragma mark - 圆角

@implementation UIView (CornerRadius)

/**
 *  设置顶部两个圆角
 *
 *  @param radii 圆角大小
 */
- (void)lf_setUpRadii:(int)radii {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(radii, radii)];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.borderColor = kRedColor.CGColor;
    layer.borderWidth = 2;
    layer.frame = self.bounds;
    self.layer.mask = layer;
}

/**
 *  设置底部两个圆角
 *
 *  @param radii 圆角大小
 */
- (void)lf_setDownRadii:(int)radii {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(radii, radii)];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = path.CGPath;
    layer.frame = self.bounds;
    self.layer.mask = layer;
}

/**
 *  设置四个圆角大小，边框宽度，边框颜色，-1 和 nil表示不设置
 *
 *  @param Radius      圆角大小
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 */
- (void)lf_setCornerRadius:(float)cornerRadius borderWidth:(float)borderWidth borderColor:(UIColor *)borderColor {
    if (cornerRadius != -1) {
        self.layer.cornerRadius = cornerRadius;
    }
    if(borderWidth != -1) {
        self.layer.borderWidth = borderWidth;
    }
    if (borderColor) {
        self.layer.borderColor = borderColor.CGColor;
    }
    
    self.layer.masksToBounds = YES;
}

@end


#pragma mark - 动画

@implementation UIView (Animation)

/**
 *  震动
 */
- (void)lf_shake {
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = 0.5;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    [self.layer addAnimation:animation forKey:nil];
}

@end


#pragma mark - 视图坐标扩展 -

@implementation UIView (ViewGeometry)

/**
 *  rect移动到中心点
 *
 *  @param rect   原矩形
 *  @param center 中心点
 *
 *  @return 新的矩形
 */
//CGRect CGRectMoveToCenter(CGRect rect, CGPoint center)
//{
//    CGRect newrect = CGRectZero;
//    newrect.origin.x = center.x - CGRectGetMidX(rect);
//    newrect.origin.y = center.y - CGRectGetMidY(rect);
//    newrect.size = rect.size;
//    return newrect;
//}

/// 坐标
- (CGPoint)lf_origin {
    return self.frame.origin;
}
- (void)setlf_origin:(CGPoint)lf_origin {
    CGRect newFrame = self.frame;
    newFrame.origin = lf_origin;
    self.frame = newFrame;
}

// 大小
- (CGSize)lf_size {
    return self.frame.size;
}
- (void)setlf_size:(CGSize)lf_size {
    CGRect newFrame = self.frame;
    newFrame.size = lf_size;
    self.frame = newFrame;
}

/// x坐标
- (CGFloat)lf_left {
    return CGRectGetMinX(self.frame);
}
- (void)setlf_left:(CGFloat)lf_left {
    CGRect newFrame = self.frame;
    newFrame.origin.x = lf_left;
    self.frame = newFrame;
}

/// y坐标
- (CGFloat)lf_top{
    return CGRectGetMinY(self.frame);
}
- (void)setlf_top:(CGFloat)lf_top {
    CGRect newFrame = self.frame;
    newFrame.origin.y = lf_top;
    self.frame = newFrame;
}

/// 宽度
- (CGFloat)lf_width{
    return CGRectGetWidth(self.frame);
}
- (void)setlf_width:(CGFloat)lf_width {
    CGRect newFrame = self.frame;
    newFrame.size.width = lf_width;
    self.frame = newFrame;
}

/// 高度
- (CGFloat)lf_height{
    return CGRectGetHeight(self.frame);
}
- (void)setlf_height:(CGFloat)lf_height {
    CGRect rect = self.frame;
    rect.size.height = lf_height;
    self.frame = rect;
}

/// 右面
- (CGFloat)lf_right {
    return CGRectGetMaxX(self.frame);
}
- (void)setlf_right:(CGFloat)lf_right {
    CGFloat delta = lf_right - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}

/// 下面
- (CGFloat)lf_bottom {
    return CGRectGetMaxY(self.frame);
}
- (void)setlf_bottom:(CGFloat)lf_bottom {
    CGRect newframe = self.frame;
    newframe.origin.y = lf_bottom - self.frame.size.height;
    self.frame = newframe;
}

/// y中心
- (CGFloat)lf_centerY {
    return CGRectGetMidY(self.frame);
}
- (void)setlf_centerY:(CGFloat)lf_centerY {
    CGPoint newCenter = self.center;
    newCenter.y = lf_centerY;
    self.center = newCenter;
}

/// x中心
- (CGFloat)lf_centerX {
    return CGRectGetMidX(self.frame);
}
- (void)setlf_centerX:(CGFloat)lf_centerX {
    CGPoint newCenter = self.center;
    newCenter.x = lf_centerX;
    self.center = newCenter;
}


/// 左下角
- (CGPoint)lf_bottomLeft {
    CGFloat x = CGRectGetMinX(self.frame);
    CGFloat y = CGRectGetMaxY(self.frame);
    return CGPointMake(x, y);
}

/// 右下角
- (CGPoint)lf_bottomRight {
    CGFloat x = CGRectGetMaxX(self.frame);
    CGFloat y = CGRectGetMaxY(self.frame);
    return CGPointMake(x, y);
}

/// 右上角
- (CGPoint)lf_topRight {
    CGFloat x = CGRectGetMaxX(self.frame);
    CGFloat y = CGRectGetMinY(self.frame);
    return CGPointMake(x, y);
}


/**
 *  根据传入的子视图与当前视图计算出水平中心开始点
 *
 *  @param subView 子视图
 *
 *  @return 水平中心开始点
 */
- (CGFloat)lf_centerHorizontalWithSubView:(UIView *)subView {
    return (self.lf_width - subView.lf_width) / 2;
}

/**
 *  根据传入的子视图与当前视图计算出垂直中心开始点
 *
 *  @param subView 子视图
 *
 *  @return 垂直中心开始点
 */
- (CGFloat)lf_centerVerticalWithSubView:(UIView *)subView {
    return (self.lf_height - subView.lf_height) / 2;
}

/**
 *  根据传入的子视图与当前视图计算出中心点
 *
 *  @param subView 子视图
 *
 *  @return 中心点
 */
- (CGPoint)lf_centerWithSubView:(UIView *)subView {
    return CGPointMake([self lf_centerHorizontalWithSubView:subView],[self lf_centerVerticalWithSubView:subView]);
}


/**
 *  居中增加子视图
 *
 *  @param subView 子视图
 */
- (void)lf_addSubViewToCenter:(UIView *)subView {
    CGRect rect = subView.frame;
    rect.origin = [self lf_centerWithSubView:subView];
    subView.frame = rect;
    [self addSubview:subView];
}

/**
 *  水平居中增加子视图
 *
 *  @param subView 子视图
 */
- (void)lf_addSubViewToHorizontalCenter:(UIView *)subView {
    CGRect rect = subView.frame;
    rect.origin.x = [self lf_centerHorizontalWithSubView:subView];
    subView.frame = rect;
    [self addSubview:subView];
}

/**
 *  垂直居中增加子视图
 *
 *  @param subView 子视图
 */
- (void)lf_addSubViewToVerticalCenter:(UIView *)subView {
    CGRect rect = subView.frame;
    rect.origin.y = [self lf_centerVerticalWithSubView:subView];
    subView.frame = rect;
    [self addSubview:subView];
}

@end


#pragma mark - 视图层次扩展 -

@implementation UIView (ZOrder)

/**
 *  获取当前视图在父视图中的索引
 *
 *  @return 索引值
 */
- (NSUInteger)lf_getSubviewIndex {
    return [self.superview.subviews indexOfObject:self];
}

/**
 *  将视图置于父视图最上面
 */
- (void)lf_bringToFront {
    [self.superview bringSubviewToFront:self];
}

/**
 *  将视图置于父视图最下面
 */
- (void)lf_sendToBack {
    [self.superview sendSubviewToBack:self];
}

/**
 *  视图层次上移一层
 */
- (void)lf_bringOneLevelUp
{
    int currentIndex = (int)[self lf_getSubviewIndex];
    [self.superview exchangeSubviewAtIndex:currentIndex withSubviewAtIndex:currentIndex+1];
}

/**
 *  视图层次下移一层
 */
- (void)lf_sendOneLevelDown {
    int currentIndex = (int)[self lf_getSubviewIndex];
    [self.superview exchangeSubviewAtIndex:currentIndex withSubviewAtIndex:currentIndex-1];
}

/**
 *  是否在最上面
 *
 *  @return 最上层视图 → YES
 */
- (BOOL)lf_isInFront {
    return [self.superview.subviews lastObject] == self;
}

/**
 *  是否在最下面
 *
 *  @return 最下层视图 → YES
 */
- (BOOL)lf_isAtBack {
    return [self.superview.subviews objectAtIndex:0] == self;
}

/**
 *  视图交换层次
 *
 *  @param swapView 交换的视图
 */
- (void)lf_swapDepthsWithView:(UIView *)swapView {
    [self.superview exchangeSubviewAtIndex:[self lf_getSubviewIndex] withSubviewAtIndex:[swapView lf_getSubviewIndex]];
}

- (void)lf_removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

- (UIView*)lf_descendantOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls])
        return self;
    
    for (UIView* child in self.subviews) {
        UIView* it = [child lf_descendantOrSelfWithClass:cls];
        if (it)
            return it;
    }
    
    return nil;
}

- (UIView*)lf_ancestorOrSelfWithClass:(Class)cls {
    if ([self isKindOfClass:cls]) {
        return self;
        
    } else if (self.superview) {
        return [self.superview lf_ancestorOrSelfWithClass:cls];
        
    } else {
        return nil;
    }
}

#pragma mark - 视图响应 －

-(void)lf_exclusiveTouchForAllButtons
{
    for (UIView * subview in [self subviews]) {
        if([subview isKindOfClass:[UIButton class]])
            [((UIButton *)subview) setExclusiveTouch:YES];
        else if ([subview isKindOfClass:[UIView class]]){
            [subview lf_exclusiveTouchForAllButtons];
        }
    }
}

#pragma mark - 视图添加手势操作 -

- (void)lf_setTapActionWithBlock:(void (^)(void))block
{
    UITapGestureRecognizer *gesture = objc_getAssociatedObject(self, &kDTActionHandlerTapGestureKey);
    
    if (!gesture)
    {
        gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForTapGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kDTActionHandlerTapGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    
    objc_setAssociatedObject(self, &kDTActionHandlerTapBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)__handleActionForTapGesture:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateRecognized)
    {
        void(^action)(void) = objc_getAssociatedObject(self, &kDTActionHandlerTapBlockKey);
        
        if (action)
        {
            action();
        }
    }
}

- (void)lf_setLongPressActionWithBlock:(void (^)(void))block
{
    UILongPressGestureRecognizer *gesture = objc_getAssociatedObject(self, &kDTActionHandlerLongPressGestureKey);
    if (!gesture)
    {
        gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForLongPressGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &kDTActionHandlerLongPressGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    objc_setAssociatedObject(self, &kDTActionHandlerLongPressBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)__handleActionForLongPressGesture:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        void(^action)(void) = objc_getAssociatedObject(self, &kDTActionHandlerLongPressBlockKey);
        
        if (action)
        {
            action();
        }
    }
}

-(void)lf_setSwipeActionWithBlock:(void (^)(void))block{
    UISwipeGestureRecognizer *gesture = objc_getAssociatedObject(self, &KDTActionHandlerSwipeGestureKey);
    
    if (!gesture) {
        gesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(__handleActionForSwipeGesture:)];
        [self addGestureRecognizer:gesture];
        objc_setAssociatedObject(self, &KDTActionHandlerSwipeGestureKey, gesture, OBJC_ASSOCIATION_RETAIN);
    }
    
    objc_setAssociatedObject(self, &KDTActionHandlerSwipeBlockKey, block, OBJC_ASSOCIATION_COPY);
}

- (void)__handleActionForSwipeGesture:(UISwipeGestureRecognizer *)gesture{
    if (gesture.direction == UISwipeGestureRecognizerDirectionRight) {
        void(^action)(void) = objc_getAssociatedObject(self, &KDTActionHandlerSwipeBlockKey);
        
        if (action) {
            action();
        }
    }
}

@end

@implementation UIView(Create)

+ (id)lf_createByFrame:(CGRect)frame
{
    NSString *className = NSStringFromClass(self);
    UIView *view = [[[NSBundle mainBundle] loadNibNamed:className owner:nil options:nil] objectAtIndex:0];
    if (view) {
        if (!CGRectIsNull(frame)) {
            view.frame = frame;
        }
    }else {
        view = [[self alloc] initWithFrame:frame];
    }
    return view;
}

@end

@implementation UIView (Effects)

///**
// *  准备高斯模糊
// */
//- (void)prepareToBlur{
//    UIGraphicsBeginImageContext(self.bounds.size);
//    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
//    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//
//    CIContext *context = [CIContext contextWithOptions:nil];
//
//    CIImage *imageToBlur = [CIImage imageWithCGImage:viewImage.CGImage];
//    CIFilter *gaussianBlurFilter = [CIFilter filterWithName: @"CIGaussianBlur"];
//    [gaussianBlurFilter setValue:imageToBlur forKey: @"inputImage"];
//    [gaussianBlurFilter setValue:[NSNumber numberWithFloat: 8] forKey: @"inputRadius"];
//    CIImage *resultImage = [gaussianBlurFilter valueForKey: @"outputImage"];
//
//    CGImageRef cgImage = [context createCGImage:resultImage fromRect:self.bounds];
//    UIImage *blurredImage = [UIImage imageWithCGImage:cgImage];
//
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
//    imageView.tag = -1;
//    imageView.image = blurredImage;
//
//    UIView *overlay = [[UIView alloc] initWithFrame:self.bounds];
//    overlay.tag = -2;
//    overlay.backgroundColor = [UIColor colorWithRed:55.0/255.0 green:55/255.0 blue:55/255.0 alpha:0.6];
//
//    [imageView setAlpha:0];
//    [overlay setAlpha:0];
//
//    [self addSubview:imageView];
//    [self addSubview:overlay];
//}
//
///**
// *  添加高斯模糊
// */
//- (void)blur{
//
//    UIImageView *imageView = (UIImageView *)[self viewWithTag:-1];
//    UIView *overlay = [self viewWithTag:-2];
//
//    [UIView animateWithDuration:0.6 animations:^{
//        [imageView setAlpha:1];
//        [overlay setAlpha:1];
//    }];
//}
//
///**
// *  撤销高斯模糊
// */
//-(void)unBlur{
//    UIImageView *imageView = (UIImageView *)[self viewWithTag:-1];
//    UIView *overlay = [self viewWithTag:-2];
//
//    [UIView animateWithDuration:0.6 animations:^{
//        [imageView setAlpha:0];
//        [overlay setAlpha:0];
//    }];
//}



/**
 *  添加高斯模糊
 */
- (void)blur{
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    FXBlurView *blurView = [[FXBlurView alloc] initWithFrame:self.window.bounds];
    blurView.dynamic = NO;
    blurView.tintColor = [UIColor colorWithWhite:1.0 alpha:0.1];
    blurView.iterations = 3; //像素偏移度
    blurView.blurRadius = 20; //模糊程度
    [blurView setAlpha:0];
    blurView.tag = 2000;
    [self.window addSubview:blurView];
    
    [UIView animateWithDuration:0.6 animations:^{
        [blurView setAlpha:1];
    }];
}

/**
 *  撤销高斯模糊
 */
-(void)unBlur{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    FXBlurView *blurView = (FXBlurView *)[self.window viewWithTag:2000];
    [UIView animateWithDuration:0.6 animations:^{
        [blurView setAlpha:0];
    } completion:^(BOOL finished) {
        [blurView removeFromSuperview];
    }];
}

@end

@implementation UIView (LayoutConstraintHelper)

- (NSLayoutConstraint*)widthConstraint
{
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeWidth && !constraint.secondItem && constraint.relation == NSLayoutRelationEqual) {
            return constraint;
        }
    }
    return nil;
}

- (NSLayoutConstraint*)heightConstraint
{
    for (NSLayoutConstraint *constraint in self.constraints) {
        if (constraint.firstAttribute == NSLayoutAttributeHeight && !constraint.secondItem && constraint.relation == NSLayoutRelationEqual) {
            return constraint;
        }
    }
    return nil;
}

- (NSLayoutConstraint*)top2SupviewConstraintWithTopLayoutGuideOwner:(UIViewController*)controller
{
    id topLayoutGuide;
    
    if ([controller respondsToSelector:@selector(topLayoutGuide)]) {
        topLayoutGuide = [controller topLayoutGuide];
    }
    
    for (NSLayoutConstraint *constraint in self.superview.constraints) {
        if (([constraint.firstItem isEqual:self] && [constraint.secondItem isEqual:topLayoutGuide] && constraint.firstAttribute == NSLayoutAttributeTop && constraint.secondAttribute == NSLayoutAttributeBottom) || ([constraint.firstItem isEqual:self] && [constraint.secondItem isEqual:self.superview] && constraint.firstAttribute == NSLayoutAttributeTop && constraint.secondAttribute == NSLayoutAttributeTop)) {
            return constraint;
        }
    }
    return nil;
}

- (NSLayoutConstraint*)bottom2SupviewConstraintWithBottomLayoutGuideOwner:(UIViewController*)controller
{
    id bottomLayoutGuide;
    
    if ([controller respondsToSelector:@selector(bottomLayoutGuide)]) {
        bottomLayoutGuide = [controller bottomLayoutGuide];
    }
    
    for (NSLayoutConstraint *constraint in self.superview.constraints) {
        if (([constraint.firstItem isEqual:bottomLayoutGuide] && [constraint.secondItem isEqual:self] && constraint.firstAttribute == NSLayoutAttributeTop && constraint.secondAttribute == NSLayoutAttributeBottom) || ([constraint.firstItem isEqual:self.superview] && [constraint.secondItem isEqual:self] && constraint.firstAttribute == NSLayoutAttributeBottom && constraint.secondAttribute == NSLayoutAttributeBottom)) {
            return constraint;
        }
    }
    return nil;
}

- (NSLayoutConstraint*)left2SupviewConstraint
{
    for (NSLayoutConstraint *constraint in self.superview.constraints) {
        if ([constraint.firstItem isEqual:self] && [constraint.secondItem isEqual:self.superview] && constraint.firstAttribute == NSLayoutAttributeLeading && constraint.secondAttribute == NSLayoutAttributeLeading) {
            return constraint;
        }
    }
    return nil;
}

- (NSLayoutConstraint*)right2SupviewConstraint
{
    for (NSLayoutConstraint *constraint in self.superview.constraints) {
        if ([constraint.firstItem isEqual:self.superview] && [constraint.secondItem isEqual:self] && constraint.firstAttribute == NSLayoutAttributeTrailing && constraint.secondAttribute == NSLayoutAttributeTrailing) {
            return constraint;
        }
    }
    return nil;
}

@end

@implementation UIView (SelfManager)

#pragma mark - Setter&Getter

- (idBlock)tapActionHandler {
    
    idBlock actionHandler = objc_getAssociatedObject(self, _cmd);
    
    return actionHandler;
}

-(void)setTapActionHandler:(idBlock)tapActionHandler {
    
    objc_setAssociatedObject(self, @selector(tapActionHandler), tapActionHandler, OBJC_ASSOCIATION_COPY);
}

@end
