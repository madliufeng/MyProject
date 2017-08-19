//
//  CALayer+lf.h
//  YDT
//
//  Created by lf on 15/5/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (LF)

/**
 *  初始化
 *
 *  @param frame 大小
 *
 *  @return 实例
 */
+ (instancetype)lf_layerWithFrame:(CGRect)frame;

/**
 *  设置初始化后的默认值
 */
- (void)lf_setInitDefaultValues;

/**
 *  设置borderColor，runtime里面可以直接用 borderColorFromUIColor
 *
 *  @param color 颜色
 */
- (void)setBorderColorFromUIColor:(UIColor *)color;

@end


#pragma mark - 动画

// 旋转 key
#define kTransformRotation  @"transform.rotation"

@interface CALayer (Animation)

/**
 *  旋转 180°
 *
 *  @param complete 完成block
 */
- (void)lf_animate180WithComplete:(void(^)())complete;

/**
 *  旋转 180°，指定方向
 *
 *  @param forward  顺时针 → YES，逆时针 → NO
 *  @param complete 完成block
 */
- (void)lf_animate180WithForward:(BOOL)forward complete:(void(^)())complete;

@end
