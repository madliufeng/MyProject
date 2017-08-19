//
//  CAShapeLayer+lf.h
//  YDT
//
//  Created by lf on 15/5/29.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAShapeLayer (LF)

/**
 *  初始化
 *
 *  @param frame    大小
 *  @param contents 内容，如果是图片需要 CGImage
 *
 *  @return 实例
 */
+ (instancetype)lf_shapeLayerWithFrame:(CGRect)frame contents:(id)contents;

@end
