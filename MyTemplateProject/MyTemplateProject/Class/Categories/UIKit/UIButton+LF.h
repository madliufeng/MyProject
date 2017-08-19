//
//  UIButton+lf.h
//  YDT
//
//  Created by lf on 15/6/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LF)

@property (nonatomic, copy) idBlock actionHandler;
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
+ (UIButton *)lf_buttonWithFrame:(CGRect)frame target:(id)target action:(SEL)action backgroundColor:(UIColor *)backgroundColor;

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
+ (UIButton *)lf_buttonWithFrame:(CGRect)frame target:(id)target action:(SEL)action backgroundImage:(UIImage *)backgroundImage;

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
+ (UIButton *)lf_buttonWithFrame:(CGRect)frame target:(id)target action:(SEL)action title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor;

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
+ (UIButton *)lf_buttonWithFrame:(CGRect)frame target:(id)target action:(SEL)action backgroundImage:(UIImage *)backgroundImage title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font;

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
+ (UIButton *)lf_buttonWithFrame:(CGRect)frame target:(id)target action:(SEL)action image:(UIImage *)image title:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font;

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
+ (UIButton *)lf_buttonWithFrame:(CGRect)frame target:(id)target action:(SEL)action image:(UIImage *)image;

+ (UIButton *)lf_buttonWithFrame:(CGRect)frame target:(id)target actionHandler:(idBlock)actionHandler image:(UIImage *)image;

@end


#pragma mark - 不同状态的背景颜色

@interface UIButton (BackgroundState)

/**
 *  设置不同状态的背景颜色，实际上是设置背景图片
 *
 *  @param backgroundColor 背景颜色
 *  @param state           不同状态
 */
- (void)lf_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

/**
 *  @author hejing
 *
 *  点击改变选中状态
 */
- (void)changeSelectState;

#pragma mark - 倒数计时按钮

/**
 *  倒计时按钮
 *
 *  @param timeLine 倒计时总时间
 *  @param title    还没倒计时的title
 *  @param subTitle 倒计时中的子名字，如时、分
 *  @param mColor   还没倒计时的颜色
 *  @param color    倒计时中的颜色
 */
- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color;


#pragma mark - 调整图片与文字的位置
/*************************************使用方式如下5种****************************/
//1.系统默认图片在左，文字在右，间隔为0
//[etbtn verticalCenterImageAndTitle:10.0f];          //2.上下居中，图片在上，文字在下
//[etbtn horizontalCenterTitleAndImage:50.0f];        //3.左右居中，文字在左，图片在右
//[etbtn horizontalCenterImageAndTitle:50.0f];        //4.左右居中，图片在左，文字在右
//[etbtn horizontalCenterTitleAndImageLeft:50.0f];    //5.文字居中，图片在左边
//[etbtn horizontalCenterTitleAndImageRight:50.0f];   //6.文字居中，图片在右边

/**
 *  上下居中，图片在上，文字在下
 *
 *  @param spacing 间距
 */
- (void)verticalCenterImageAndTitle:(CGFloat)spacing font:(UIFont *)font;
- (void)verticalCenterImageAndTitle; //默认6.0

/**
 *  左右居中，文字在左，图片在右
 *
 *  @param spacing 间距
 */
- (void)horizontalCenterTitleAndImage:(CGFloat)spacing font:(UIFont *)font;

- (void)horizontalCenterTitleAndImage; //默认6.0

/**
 *  左右居中，图片在左，文字在右
 *
 *  @param spacing 间距
 */
- (void)horizontalCenterImageAndTitle:(CGFloat)spacing;
- (void)horizontalCenterImageAndTitle; //默认6.0

/**
 *  文字居中，图片在左边
 *
 *  @param spacing 间距
 */
- (void)horizontalCenterTitleAndImageLeft:(CGFloat)spacing;
- (void)horizontalCenterTitleAndImageLeft; //默认6.0

/**
 *  文字居中，图片在右边
 *
 *  @param spacing 间距
 */
- (void)horizontalCenterTitleAndImageRight:(CGFloat)spacing;
- (void)horizontalCenterTitleAndImageRight; //默认6.0

@end


