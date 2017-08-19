//
//  LFSettingItem.h
//  MyTemplateProject
//
//  Created by Pro on 17/5/31.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFSettingItem : NSObject

/**
 *  图标
 */
@property (nonatomic, strong) UIImage *image;
/**
 *  标题
 */
@property (nonatomic, copy) NSString *title;
/**
 *  子标题
 */
@property (nonatomic, copy) NSString *subTitle;
/**
 *  点击这行cell要做的事情
 */
@property (nonatomic, strong) void(^operation)(NSIndexPath *indexPath);

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title;

+ (instancetype)itemWithTitle:(NSString *)title;

@end
