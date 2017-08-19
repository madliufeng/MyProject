//
//  UIView+lf.h
//  YDT
//
//  Created by lf on 15/6/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LF) <UIWebViewDelegate>

/**
 *  初始化
 *
 *  @param rect      大小
 *  @param backColor 背景颜色
 *
 *  @return 实例
 */
+ (UIView *)lf_viewWithFrame:(CGRect)rect backColor:(UIColor *)backColor;

/**
 *  将视图转为图片
 *
 *  @return 图片
 */
- (UIImage *)lf_toImage;

/**
 *  拨打电话号码，弹出提示框
 *
 *  @param phoneNumber 电话号码
 *  @param view        指定视图
 */
- (void)telWithPhoneNumber:(NSString *)phoneNumber;

/**
 *  重设x起点
 *
 *  @param x        新的x坐标
 *  @param animated 是否允许动画
 */
- (void)lf_resetOriginX:(float)x animated:(BOOL)animated;

/**
 *  重设y起点
 *
 *  @param y        新的y坐标
 *  @param animated 是否允许动画
 */
- (void)lf_resetOriginY:(float)y animated:(BOOL)animated;

@end


#pragma mark - 圆角

@interface UIView (CornerRadius)

/**
 *  设置顶部两个圆角
 *
 *  @param radii 圆角大小
 */
- (void)lf_setUpRadii:(int)radii;

/**
 *  设置底部两个圆角
 *
 *  @param radii 圆角大小
 */
- (void)lf_setDownRadii:(int)radii;

/**
 *  设置四个圆角大小，边框宽度，边框颜色，-1 和 nil表示不设置
 *
 *  @param Radius      圆角大小
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 */
- (void)lf_setCornerRadius:(float)Radius borderWidth:(float)Width borderColor:(UIColor *)BorderColor;

@end


#pragma mark - 动画

@interface UIView (Animation)

/**
 *  震动
 */
- (void)lf_shake;

@end


#pragma mark - 视图坐标扩展

@interface UIView (ViewFrameGeometry)

/**
 *  rect移动到中心点
 *
 *  @param rect   原矩形
 *  @param center 中心点
 *
 *  @return 新的矩形
 */
//CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

/// 坐标
@property (assign, nonatomic) CGPoint lf_origin;
/// 大小
@property (assign, nonatomic) CGSize lf_size;

/// x坐标
@property (assign, nonatomic) CGFloat lf_left;
/// y坐标
@property (assign, nonatomic) CGFloat lf_top;
/// 宽度
@property (assign, nonatomic) CGFloat lf_width;
/// 高度
@property (assign, nonatomic) CGFloat lf_height;

/// 右面
@property (assign, nonatomic) CGFloat lf_right;
/// 下面
@property (assign, nonatomic) CGFloat lf_bottom;

/// y中心
@property (assign, nonatomic) CGFloat lf_centerY;

/// x中心
@property (nonatomic, assign) CGFloat lf_centerX;

/// 左下角
@property (assign, nonatomic, readonly) CGPoint lf_bottomLeft;
/// 右下角
@property (assign, nonatomic, readonly) CGPoint lf_bottomRight;
/// 右上角
@property (assign, nonatomic, readonly) CGPoint lf_topRight;


/**
 *  根据传入的子视图与当前视图计算出水平中心开始点
 *
 *  @param subView 子视图
 *
 *  @return 水平中心开始点
 */
- (CGFloat)lf_centerHorizontalWithSubView:(UIView *)subView;

/**
 *  根据传入的子视图与当前视图计算出垂直中心开始点
 *
 *  @param subView 子视图
 *
 *  @return 垂直中心开始点
 */
- (CGFloat)lf_centerVerticalWithSubView:(UIView *)subView;

/**
 *  根据传入的子视图与当前视图计算出中心点
 *
 *  @param subView 子视图
 *
 *  @return 中心点
 */
- (CGPoint)lf_centerWithSubView:(UIView *)subView;


/**
 *  居中增加子视图
 *
 *  @param subView 子视图
 */
- (void)lf_addSubViewToCenter:(UIView *)subView;

/**
 *  水平居中增加子视图
 *
 *  @param subView 子视图
 */
- (void)lf_addSubViewToHorizontalCenter:(UIView *)subView;

/**
 *  垂直居中增加子视图
 *
 *  @param subView 子视图
 */
- (void)lf_addSubViewToVerticalCenter:(UIView *)subView;

@end



#pragma mark - 视图层次扩展 -

@interface UIView (ZOrder)

/**
 *  获取当前视图在父视图中的索引
 *
 *  @return 索引值
 */
- (NSUInteger)lf_getSubviewIndex;

/**
 *  将视图置于父视图最上面
 */
- (void)lf_bringToFront;

/**
 *  将视图置于父视图最下面
 */
- (void)lf_sendToBack;

/**
 *  视图层次上移一层
 */
- (void)lf_bringOneLevelUp;

/**
 *  视图层次下移一层
 */
- (void)lf_sendOneLevelDown;

/**
 *  是否在最上面
 *
 *  @return 最上层视图 → YES
 */
- (BOOL)lf_isInFront;

/**
 *  是否在最下面
 *
 *  @return 最下层视图 → YES
 */
- (BOOL)lf_isAtBack;

/**
 *  视图交换层次
 *
 *  @param swapView 交换的视图
 */
- (void)lf_swapDepthsWithView:(UIView*)swapView;

/**
 * Removes all subviews.
 */
- (void)lf_removeAllSubviews;

/**
 * Finds the first descendant view (including this view) that is a member of a particular class.
 */
- (UIView*)lf_descendantOrSelfWithClass:(Class)cls;

/**
 * Finds the first ancestor view (including this view) that is a member of a particular class.
 */
- (UIView*)lf_ancestorOrSelfWithClass:(Class)cls;

#pragma mark - 视图响应 －

/**
 * Exclusive all the buttons in view 通过设置[self setExclusiveTouch:YES];可以达到同一界面上多个控件接受事件时的排他性，从而避免一些问题。
 */
-(void)lf_exclusiveTouchForAllButtons;

#pragma mark - 视图添加手势操作 -

/**
 Attaches the given block for a single tap action to the receiver.
 @param block The block to execute.
 */
- (void)lf_setTapActionWithBlock:(void (^)(void))block;

/**
 Attaches the given block for a long press action to the receiver.
 @param block The block to execute.
 */
- (void)lf_setLongPressActionWithBlock:(void (^)(void))block;

/**
 Attaches the given block for a swipe action to the receiver.
 @param block The block to execute.
 */
-(void)lf_setSwipeActionWithBlock:(void (^)(void))block;

@end

@interface UIView(Create)


/**
 * create From Nib method , You can pass CGRectNull if you do not want to change the size of View in Nib
 *
 */
+ (id)lf_createByFrame:(CGRect)frame;

@end

@interface UIView (Effects)
///**
// *  准备高斯模糊
// */
//- (void)prepareToBlur;
//
///**
// *  添加高斯模糊
// *
// *  @param block 点击模糊的范围触发的事件
// */
//- (void)blur;
//
///**
// *  撤销高斯模糊
// */
//- (void)unBlur;
//
//
/////**
//// *  点击模糊的范围触发的事件
//// */
////- (void)tapBlurView;
//
//
///**
// *  纯色设置高斯模糊
// *
// *  @param blurTintColor 颜色
// */
//- (void) setBlurTintColor:(UIColor *)blurTintColor;


/**
 *  添加高斯模糊
 *
 *  @param block 点击模糊的范围触发的事件
 */
- (void)blur;

/**
 *  撤销高斯模糊
 */
- (void)unBlur;

@end

@interface UIView (LayoutConstraintHelper)

- (NSLayoutConstraint*)widthConstraint;

- (NSLayoutConstraint*)heightConstraint;

- (NSLayoutConstraint*)top2SupviewConstraintWithTopLayoutGuideOwner:(UIViewController*)controller;

- (NSLayoutConstraint*)bottom2SupviewConstraintWithBottomLayoutGuideOwner:(UIViewController*)controller;

- (NSLayoutConstraint*)left2SupviewConstraint;

- (NSLayoutConstraint*)right2SupviewConstraint;

@end

@interface UIView (SelfManager)

@property (nonatomic, copy) idBlock tapActionHandler;

@end

