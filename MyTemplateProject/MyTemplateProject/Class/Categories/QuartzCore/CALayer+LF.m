//
//  CALayer+lf.m
//  YDT
//
//  Created by lf on 15/5/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "CALayer+LF.h"

@implementation CALayer (LF)

/**
 *  初始化
 *
 *  @param frame 大小
 *
 *  @return 实例
 */
+ (instancetype)lf_layerWithFrame:(CGRect)frame {
    CALayer *layer = [CALayer layer];
    layer.frame = frame;
    
    [layer lf_setInitDefaultValues];
    
    return layer;
}

/**
 *  设置初始化后的默认值
 */
- (void)lf_setInitDefaultValues {
    // default value...
    self.contentsScale = [UIScreen mainScreen].scale;
}

/**
 *  设置borderColor，runtime里面可以直接用 borderColorFromUIColor
 *
 *  @param color 颜色
 */
- (void)setBorderColorFromUIColor:(UIColor *)color {
    self.borderColor = color.CGColor;
}

@end


#pragma mark - 动画

@implementation CALayer (Animation)

/**
 *  旋转 180°
 *
 *  @param complete 完成block
 */
- (void)lf_animate180WithComplete:(void(^)())complete {
    BOOL isForward = NO;
    if ([[self valueForKeyPath:kTransformRotation] floatValue] == 0) {
        isForward = YES;
    }
    
    [self lf_animate180WithForward:isForward complete:complete];
}

/**
 *  旋转 180°，指定方向
 *
 *  @param forward  顺时针 → YES，逆时针 → NO
 *  @param complete 完成block
 */
- (void)lf_animate180WithForward:(BOOL)forward complete:(void(^)())complete {
    //    [CATransaction begin];
    //    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithControlPoints:0.4 :0.0 :0.2 :1.0]];
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:kTransformRotation];
    anim.values = forward ? @[ @0, @(M_PI) ] : @[ @(M_PI), @(M_PI * 2) ];
    
    [self addAnimation:anim forKey:anim.keyPath];
    if (anim.removedOnCompletion) {
        [self setValue:anim.values.lastObject forKeyPath:anim.keyPath];
    }
    
    //    [CATransaction commit];
    
    if (complete) {
        complete();
    }
}

@end
