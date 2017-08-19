//
//  UITextView+lf.m
//  YDT
//
//  Created by lf on 15/6/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "UITextView+LF.h"

@implementation UITextView (LF)

/**
 *  初始化
 *
 *  @param frame           大小
 *  @param font            字体
 *  @param backgroundColor 背景颜色
 *
 *  @return 实例
 */
+ (UITextView *)lf_textViewWithFrame:(CGRect)frame font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor {
    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    textView.backgroundColor = backgroundColor;
    textView.font = font;
    
    return textView;
}

@end
