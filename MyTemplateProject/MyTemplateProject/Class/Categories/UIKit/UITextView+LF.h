//
//  UITextView+lf.h
//  YDT
//
//  Created by lf on 15/6/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (LF)

/**
 *  初始化
 *
 *  @param frame           大小
 *  @param font            字体
 *  @param backgroundColor 背景颜色
 *
 *  @return 实例
 */
+ (UITextView *)lf_textViewWithFrame:(CGRect)frame font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor;

@end
