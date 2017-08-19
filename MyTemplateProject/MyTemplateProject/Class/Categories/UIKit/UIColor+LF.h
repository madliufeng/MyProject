//
//  UIColor+lf.h
//  YDT
//
//  Created by lf on 15/6/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LF)

/**
 *  将由6个字符十六进制颜色转换到UIColor对象，会自动截取前面的 #号
 */
+ (UIColor *)lf_hexColor:(NSString *)hexColor;

/**
 *  获取随机颜色color
 */
+ (UIColor *)lf_randomColor;

@end
