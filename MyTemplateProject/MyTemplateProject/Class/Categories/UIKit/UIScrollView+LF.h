//
//  UIScrollView+lf.h
//  YDT
//
//  Created by lf on 15/6/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (LF)

/**
 *  初始化
 *
 *  @param frame           大小
 *  @param contentSize     内容大小
 *  @param backgroundColor 背景颜色
 *  @param delegate        代理
 *
 *  @return 实例
 */
+ (UIScrollView *)lf_scrollViewWithFrame:(CGRect)frame contentSize:(CGSize)contentSize backgroundColor:(UIColor *)backgroundColor delegate:(id<UIScrollViewDelegate>)delegate;

@end
