//
//  LFSettingTableViewCell.h
//  MyTemplateProject
//
//  Created by Pro on 17/5/31.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFSettingArrowItem.h"
#import "LFSettingSwitchItem.h"
#import "LFSettingItem.h"
#import "LFSettingGroup.h"

@interface LFSettingTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style;
/**
 *  航模型
 */
@property (nonatomic, strong) LFSettingItem *item;

@end
