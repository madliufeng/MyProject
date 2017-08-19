//
//  LFSettingGroup.h
//  MyTemplateProject
//
//  Created by Pro on 17/5/31.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFSettingGroup : NSObject

/**
 *  行模型数组
 */
@property (nonatomic, strong) NSArray *items;
/**
 *  头部标题
 */
@property (nonatomic, copy) NSString *headerTitle;
/**
 *  尾部标题
 */
@property (nonatomic, copy) NSString *footTitle;

+ (instancetype)groupWithItems:(NSArray *)items;

@end
