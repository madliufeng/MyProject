//
//  CATransition+lf.h
//  YDT
//
//  Created by lf on 15/6/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CATransition (LF)

/**
 *  过渡动画，duration 默认 0.3
 *
 *  @param type    过渡类型，例如 kCATransitionFade
 *  @param subType 过渡方向，例如 kCATransitionFromRight
 *
 *  @return 动画
 */
+ (instancetype)lf_transitionWithType:(NSString *)type subType:(NSString *)subType;

@end
