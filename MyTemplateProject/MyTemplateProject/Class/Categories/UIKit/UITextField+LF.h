//
//  UITextField+lf.h
//  YDT
//
//  Created by lf on 15/6/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (LF)

/// 是否是空的文本，空文本 → YES，非空文本 → NO
@property (nonatomic, assign, readonly) BOOL lf_isEmptyText;


/**
 *  初始化
 *
 *  @param frame           大小
 *  @param placeholder     占位文本
 *  @param font            字体
 *  @param textAlignment   文本对齐方式
 *  @param backgroundColor 背景颜色
 *
 *  @return 实例
 */
+ (UITextField *)lf_textFieldWithFrame:(CGRect)frame placeholder:(NSString *)placeholder font:(UIFont *)font textAlignment:(NSTextAlignment)textAlignment backgroundColor:(UIColor *)backgroundColor;

@end
