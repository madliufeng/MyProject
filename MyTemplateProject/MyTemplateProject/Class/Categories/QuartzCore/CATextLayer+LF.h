//
//  CATextLayer+lf.h
//  YDT
//
//  Created by lf on 15/5/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CATextLayer (LF)

/**
 *  初始化
 *
 *  @param frame           大小
 *  @param string          字符串
 *  @param font            字体
 *  @param foregroundColor 前景色，nil则系统默认为白色
 *
 *  @return 实例
 */
+ (instancetype)lf_textLayerWithFrame:(CGRect)frame string:(id)string fontSize:(CGFloat)fontSize foregroundColor:(CGColorRef)foregroundColor;

@end
