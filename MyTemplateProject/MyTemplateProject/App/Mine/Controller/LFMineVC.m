//
//  LFMineVC.m
//  MyTemplateProject
//
//  Created by Pro on 17/5/19.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFMineVC.h"
#import "LFMyResourceVC.h"

@interface LFMineVC ()

@end

@implementation LFMineVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];


}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear: animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我";
    self.tableView.sectionHeaderHeight = 10.0f;
    self.tableView.sectionFooterHeight = 0.0f;
    [self setupGroups];
}

- (void)setupGroups
{
    
    LFSettingItem *item = [LFSettingArrowItem itemWithImage:[UIImage imageNamed:@"icon_wallet"] title:@"钱包"];
    LFSettingGroup *group0 = [LFSettingGroup groupWithItems:@[item]];
    [self.groups addObject:group0];
    
    
    LFSettingItem *item0 = [LFSettingArrowItem itemWithImage:[UIImage imageNamed:@"icon_member"] title:@"会员中心"];
    LFSettingItem *item1 = [LFSettingArrowItem itemWithImage:[UIImage imageNamed:@"icon_vouchers"] title:@"代金券"];
    LFSettingItem *item2 = [LFSettingArrowItem itemWithImage:[UIImage imageNamed:@"icon_resource_folder"] title:@"我的资源夹"];

    LFSettingGroup *group1 = [LFSettingGroup groupWithItems:@[item0,item1,item2]];
    [self.groups addObject:group1];
    
    
    LFSettingItem *item3 = [LFSettingArrowItem itemWithImage:[UIImage imageNamed:@"icon_mycomments"] title:@"机构点评"];
    LFSettingItem *item4 = [LFSettingArrowItem itemWithImage:[UIImage imageNamed:@"icon_attention"] title:@"我的机构"];
    LFSettingItem *item5 = [LFSettingArrowItem itemWithImage:[UIImage imageNamed:@"icon_mechanism"] title:@"系统设置"];
    LFSettingGroup *group2 = [LFSettingGroup groupWithItems:@[item3,item4,item5]];
    [self.groups addObject:group2];

    
}


@end
