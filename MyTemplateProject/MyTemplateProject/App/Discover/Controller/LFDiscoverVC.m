//
//  LFDiscoverVC.m
//  MyTemplateProject
//
//  Created by Pro on 17/5/19.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFDiscoverVC.h"
#import "LFSettingItem.h"
#import "LFSettingGroup.h"
@interface LFDiscoverVC ()

@end

@implementation LFDiscoverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"发现";
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.tableView.sectionHeaderHeight = 10.0f;
    self.tableView.sectionFooterHeight = 0.0f;
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);

    [self setupGroup];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)setupGroup
{
    LFSettingItem *item = [LFSettingArrowItem itemWithImage:[UIImage imageNamed:@"icon_near"] title:@"课堂笔记"];
    LFSettingGroup *group0 = [LFSettingGroup groupWithItems:@[item]];
    [self.groups addObject:group0];
    
    
    LFSettingItem *item0 = [LFSettingArrowItem itemWithImage:[UIImage imageNamed:@"icon_scan_black"] title:@"扫一扫"];
    LFSettingItem *item1 = [LFSettingArrowItem itemWithImage:[UIImage imageNamed:@"icon_to_touch"] title:@"碰一碰"];
    LFSettingGroup *group1 = [LFSettingGroup groupWithItems:@[item0,item1]];
    [self.groups addObject:group1];
    
    
    LFSettingItem *item2 = [LFSettingArrowItem itemWithImage:[UIImage imageNamed:@"icon_mall"] title:@"商城"];
    LFSettingGroup *group2 = [LFSettingGroup groupWithItems:@[item2]];
    [self.groups addObject:group2];
    
    
}



@end
