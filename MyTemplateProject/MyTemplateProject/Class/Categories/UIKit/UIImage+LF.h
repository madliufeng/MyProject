//
//  UIImage+lf.h
//  YDT
//
//  Created by lf on 15/6/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LF)

/**
 *  截取图中某部分小图
 *
 *  @param rect 矩形区域
 *
 *  @return 截取的图片
 */
- (UIImage *)lf_captureImageWithRect:(CGRect)rect;

/**
 *  缩放图片
 *
 *  @param size 指定大小
 *
 *  @return 缩放后的图片
 */
- (UIImage *)lf_scaleToSize:(CGSize)size;

/**
 *  通过颜色返回图片
 *
 *  @param color 颜色
 *
 *  @return 图片
 */
+ (UIImage *)lf_imageWithColor:(UIColor *)color;

/**
 *  @author hejing
 *
 *  图片的size宽度
 *
 *  @return 图片的size宽度
 */
- (CGFloat)lf_sizeWidth;

/**
 *  @author hejing
 *
 *  图片的size高度
 *
 *  @return 图片的size高度
 */
- (CGFloat)lf_sizeHeight;

/**
 *  争对ios7以上的系统适配新的图片资源
 *
 *  @param imageName 图片名称
 *
 *  @return 新的图片
 */
+ (UIImage*)lf_imageWithName:(NSString *) imageName;

/**
 *  生成可以拉伸指定位置的图片
 *
 *  @param imageName 图片名字
 *
 *  @return 新的图片
 */
+ (UIImage*)lf_resizableImageWithName:(NSString *)imageName;

/**
 *  图片缩放
 *
 *  @param size 指定大小
 *
 *  @return 缩放后的图片
 */
- (UIImage*)lf_scaleImageWithSize:(CGSize)size;


@end
