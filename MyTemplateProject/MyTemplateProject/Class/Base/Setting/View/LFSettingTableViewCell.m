//
//  LFSettingTableViewCell.m
//  MyTemplateProject
//
//  Created by Pro on 17/5/31.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFSettingTableViewCell.h"
@implementation LFSettingTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style{
    static NSString *ID = @"cell";
    
    LFSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    if (cell == nil) {
        cell = [[LFSettingTableViewCell alloc] initWithStyle:style reuseIdentifier:ID];
    }
    return cell;
}
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    return [self cellWithTableView:tableView style:UITableViewCellStyleValue1];
}
- (void)setItem:(LFSettingItem *)item{
    _item = item;
    self.imageView.image = item.image;
    self.textLabel.text = item.title;
    self.detailTextLabel.text = item.subTitle;
    
    [self setupRightView];
}
/**
 *  设置右侧视图
 */
- (void)setupRightView{
    if ([_item isKindOfClass:[LFSettingArrowItem class]]) { // 剪头
        self.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }else if ([_item isKindOfClass:[LFSettingSwitchItem class]]){
        LFSettingSwitchItem *swItem = (LFSettingSwitchItem *)_item;
        UISwitch *sw = [[UISwitch alloc] init];
        sw.on = swItem.open;
        
        self.accessoryView = sw;
    }else{
        // 注意, 一定要清空
        self.accessoryView = nil;
    }
    
}
@end
