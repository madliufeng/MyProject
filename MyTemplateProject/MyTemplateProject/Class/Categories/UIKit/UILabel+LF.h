//
//  UILabel+lf.h
//  YDT
//
//  Created by lf on 15/6/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LF)

/**
 *  初始化
 *
 *  @param frame           大小
 *  @param text            文本
 *  @param textColor       文本颜色
 *  @param font            字体
 *  @param textAlignment   文本对齐方式
 *  @param backgroundColor 背景颜色
 *
 *  @return 实例
 */
+ (UILabel *)lf_labelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment backgroundColor:(UIColor *)backgroundColor;

/**
 *  创建自适应高度的label，frame的高度将会被忽略
 *
 *  @param frame         大小
 *  @param text          文本
 *  @param textColor     文本颜色
 *  @param font          字体
 *  @param textAlignment 文本对齐方式
 *
 *  @return 实例
 */
+ (UILabel *)lf_labelAdaptionWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment;

@end

#pragma mark - 对齐样式

@interface UILabel (VerticalAlign)

/**
 *  顶部对齐
 */
- (void)lf_alignTop;

/**
 *  底部对齐
 */
- (void)lf_alignBottom;

@end

@interface UILabel (FormattedText)

- (void)lf_setTextColor:(UIColor *)textColor range:(NSRange)range;

- (void)lf_setTextColor:(UIColor *)textColor fromStringLocation:(NSUInteger)location;

- (void)lf_setFont:(UIFont *)font range:(NSRange)range;

- (void)lf_setLineSpace:(CGFloat)space;

- (void)lf_setTextColor:(UIColor *)textColor subString:(NSString *)subString;

- (void)lf_setTextFont:(UIFont *)textFont subString:(NSString *)subString;

- (CGFloat)lf_contentHeight;

- (CGFloat)lf_contentWeigh;

- (void)lf_headBaseStringAddString:(NSString *)addString;

@property (nonatomic, copy) NSString *lf_headBaseString;

@end

@interface UILabel (lf_ShopCart)

- (void)lf_shopCartNumIncrease;

- (void)lf_shopCartNumReduce;

@end
