//
//  LFSettingGroup.m
//  MyTemplateProject
//
//  Created by Pro on 17/5/31.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFSettingGroup.h"

@implementation LFSettingGroup

+ (instancetype)groupWithItems:(NSArray *)items{
    LFSettingGroup *group = [[LFSettingGroup alloc] init];
    group.items = items;
    return group;
}
@end
