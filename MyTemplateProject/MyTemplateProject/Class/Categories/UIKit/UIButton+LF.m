//
//  UIButton+lf.m
//  YDT
//
//  Created by lf on 15/6/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "UIButton+LF.h"

@implementation UIButton (LF)

@dynamic actionHandler;

+ (void)touchUpInsideButton: (UIButton *)button {
    
    button.actionHandler(button);
}

/**
 *  初始化
 *
 *  @param frame  大小
 *  @param target 对象
 *  @param action 事件
 *
 *  @return 实例
 */
+ (UIButton *)private_buttonWithFrame:(CGRect)frame target:(id)target action:(SEL)action {
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

+ (UIButton *)private_buttonWithFrame:(CGRect)frame target:(id)target actionHandler:(idBlock)actionHandler {
    
    UIButton *button = [UIButton private_buttonWithFrame:frame target:self action:@selector(touchUpInsideButton:)];
    button.actionHandler = actionHandler;
    
    return button;
}

/**
 *  初始化，无图无字
 *
 *  @param frame           大小
 *  @param target          对象
 *  @param action          事件
 *  @param backgroundColor 背景颜色
 *
 *  @return 实例
 */
+ (UIButton *)lf_buttonWithFrame:(CGRect)frame target:(id)target action:(SEL)action backgroundColor:(UIColor *)backgroundColor
{
    UIButton *button = [self private_buttonWithFrame:frame target:target action:action];
    button.backgroundColor = backgroundColor;
    
    return button;
}

/**
 *  初始化，背景图片
 *
 *  @param frame           大小
 *  @param target          对象
 *  @param action          事件
 *  @param backgroundImage 背景图片
 *
 *  @return 实例
 */
+ (UIButton *)lf_buttonWithFrame:(CGRect)frame target:(id)target action:(SEL)action backgroundImage:(UIImage *)backgroundImage
{
    UIButton *button = [self private_buttonWithFrame:frame target:target action:action];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    
    return button;
}

/**
 *  初始化，文字
 *
 *  @param frame           大小
 *  @param target          对象
 *  @param action          事件
 *  @param title           标题
 *  @param titleColor      标题颜色
 *  @param font            字体
 *  @param backgroundColor 背景颜色
 *
 *  @return 实例
 */
+ (UIButton *)lf_buttonWithFrame:(CGRect)frame target:(id)target action:(SEL)action title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor
{
    UIButton *button = [self private_buttonWithFrame:frame target:target action:action];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    button.backgroundColor = backgroundColor;
    
    return button;
}

/**
 *  初始化，背景图 + 文字
 *
 *  @param frame           大小
 *  @param target          对象
 *  @param action          事件
 *  @param backgroundImage 背景图片
 *  @param title           标题
 *  @param titleColor      标题颜色
 *  @param font            字体
 *
 *  @return 实例
 */
+ (UIButton *)lf_buttonWithFrame:(CGRect)frame target:(id)target action:(SEL)action backgroundImage:(UIImage *)backgroundImage title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font
{
    UIButton *button = [self private_buttonWithFrame:frame target:target action:action];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    
    return button;
}

/**
 *  初始化，图片 + 文字
 *
 *  @param frame      大小
 *  @param target     对象
 *  @param action     事件
 *  @param image      图片
 *  @param title      标题
 *  @param titleColor 标题颜色
 *  @param font       字体
 *
 *  @return 实例
 */
+ (UIButton *)lf_buttonWithFrame:(CGRect)frame target:(id)target action:(SEL)action image:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font {
    UIButton *button = [self private_buttonWithFrame:frame target:target action:action];
    [button setImage:image forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = font;
    
    return button;
}

/**
 *  初始化，图片
 *
 *  @param frame  大小
 *  @param target 对象
 *  @param action 事件
 *  @param image  图片
 *
 *  @return 实例
 */
+ (UIButton *)lf_buttonWithFrame:(CGRect)frame target:(id)target action:(SEL)action image:(UIImage *)image {
    UIButton *button = [self private_buttonWithFrame:frame target:target action:action];
    [button setImage:image forState:UIControlStateNormal];
    
    return button;
}

+ (UIButton *)lf_buttonWithFrame:(CGRect)frame target:(id)target actionHandler:(idBlock)actionHandler image:(UIImage *)image {
    
    UIButton *button = [self private_buttonWithFrame:frame target:target actionHandler:actionHandler];
    [button setImage:image forState:UIControlStateNormal];
    
    return button;
}

@end


#pragma mark - 不同状态的背景颜色

@implementation UIButton (BackgroundState)

/**
 *  设置不同状态的背景颜色，实际上是设置背景图片
 *
 *  @param backgroundColor 背景颜色
 *  @param state           不同状态
 */
- (void)lf_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundImage:[UIImage lf_imageWithColor:backgroundColor] forState:state];
}

- (void)changeSelectState {
    
    self.selected = !self.selected;
}

#pragma mark - Setter&Getter

- (idBlock)actionHandler {
    
    idBlock actionHandler = objc_getAssociatedObject(self, _cmd);
    
    return actionHandler;
}

-(void)setActionHandler:(idBlock)actionHandler {
  
    objc_setAssociatedObject(self, @selector(actionHandler), actionHandler, OBJC_ASSOCIATION_COPY);
}

#pragma mark - 倒数计时按钮

- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color {
    
    //倒计时时间
    __block NSInteger timeOut = timeLine;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //每秒执行一次
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        
        //倒计时结束，关闭
        if (timeOut <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = mColor;
                [self setTitle:title forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        } else {
            int seconds = timeOut % 60;
            NSString *timeStr = [NSString stringWithFormat:@"%0.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.backgroundColor = color;
                [self setTitle:[NSString stringWithFormat:@"%@%@",timeStr,subTitle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
            });
            timeOut--;
        }
    });
    dispatch_resume(_timer);
}


#pragma mark - 调整图片与文字的位置

/**
 *  上下居中，图片在上，文字在下
 *
 *  @param spacing 间距
 */
- (void)verticalCenterImageAndTitle:(CGFloat)spacing font:(UIFont *)font
{
    // get the size of the elements here for readability
    CGSize imageSize = self.imageView.frame.size;
    //    CGSize titleSize = self.titleLabel.frame.size;
    
    CGSize titleSize = [self.titleLabel.text lf_sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, 17)];
    
    // lower the text and push it left to center it
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (imageSize.height + spacing/2), 0.0);
    
    // the text width might have changed (in case it was shortened before due to
    // lack of space and isn't anymore now), so we get the frame size again
    //    titleSize = self.titleLabel.frame.size;
    
    // raise the image and push it right to center it
    self.imageEdgeInsets = UIEdgeInsetsMake(- (titleSize.height + spacing/2), 0.0, 0.0, -(titleSize.width));
    
}
- (void)verticalCenterImageAndTitle
{
    const int DEFAULT_SPACING = 6.0f;
    UIFont *font = [UIFont systemFontOfSize:14];
    [self verticalCenterImageAndTitle:DEFAULT_SPACING font:font];
    
}

/**
 *  左右居中，文字在左，图片在右
 *
 *  @param spacing 间距
 */
- (void)horizontalCenterTitleAndImage:(CGFloat)spacing font:(UIFont *)font

{
    // get the size of the elements here for readability
    CGSize imageSize = self.imageView.frame.size;
//    CGSize titleSize = self.titleLabel.frame.size;
    CGSize titleSize = [self.titleLabel.text lf_sizeWithFont:font constrainedToSize:CGSizeMake(MAXFLOAT, 17)];
    
    // lower the text and push it left to center it
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, 0.0, imageSize.width + spacing/2);
    
    // the text width might have changed (in case it was shortened before due to
    // lack of space and isn't anymore now), so we get the frame size again
    titleSize = self.titleLabel.frame.size;
    
    // raise the image and push it right to center it
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width + spacing/2, 0.0, - titleSize.width);
    
}
- (void)horizontalCenterTitleAndImage
{
    const int DEFAULT_SPACING = 6.0f;
    [self horizontalCenterTitleAndImage:DEFAULT_SPACING font:FONT(15)];
    
}

/**
 *  左右居中，图片在左，文字在右
 *
 *  @param spacing 间距
 */
- (void)horizontalCenterImageAndTitle:(CGFloat)spacing
{
    // get the size of the elements here for readability
    //    CGSize imageSize = self.imageView.frame.size;
    //    CGSize titleSize = self.titleLabel.frame.size;
    
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0,  0.0, 0.0,  - spacing/2);
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, - spacing/2, 0.0, 0.0);
    
}
- (void)horizontalCenterImageAndTitle
{
    const int DEFAULT_SPACING = 6.0f;
    [self horizontalCenterImageAndTitle:DEFAULT_SPACING];
    
}

/**
 *  文字居中，图片在左边
 *
 *  @param spacing 间距
 */
- (void)horizontalCenterTitleAndImageLeft:(CGFloat)spacing
{
    // get the size of the elements here for readability
    //    CGSize imageSize = self.imageView.frame.size;
    //    CGSize titleSize = self.titleLabel.frame.size;
    
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, - spacing, 0.0, 0.0);
    
}
- (void)horizontalCenterTitleAndImageLeft
{
    const int DEFAULT_SPACING = 6.0f;
    [self horizontalCenterTitleAndImageLeft:DEFAULT_SPACING];
    
}

/**
 *  文字居中，图片在右边
 *
 *  @param spacing 间距
 */
- (void)horizontalCenterTitleAndImageRight:(CGFloat)spacing
{
    // get the size of the elements here for readability
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    
    // lower the text and push it left to center it
    self.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, 0.0, 0.0);
    
    // the text width might have changed (in case it was shortened before due to
    // lack of space and isn't anymore now), so we get the frame size again
    titleSize = self.titleLabel.frame.size;
    
    // raise the image and push it right to center it
    self.imageEdgeInsets = UIEdgeInsetsMake(0.0, titleSize.width + imageSize.width + spacing, 0.0, - titleSize.width);
}


- (void)horizontalCenterTitleAndImageRight
{
    const int DEFAULT_SPACING = 6.0f;
    [self horizontalCenterTitleAndImageRight:DEFAULT_SPACING];
    
}



@end


