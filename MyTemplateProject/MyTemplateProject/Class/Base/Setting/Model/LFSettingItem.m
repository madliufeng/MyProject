//
//  LFSettingItem.m
//  MyTemplateProject
//
//  Created by Pro on 17/5/31.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFSettingItem.h"

@implementation LFSettingItem

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title{
    LFSettingItem *item = [[self alloc] init];
    item.image = image;
    item.title = title;
    return item;
}
+ (instancetype)itemWithTitle:(NSString *)title{
    return [self itemWithImage:nil title:title];
}

@end
