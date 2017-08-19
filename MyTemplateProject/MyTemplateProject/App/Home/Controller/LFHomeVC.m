//
//  LFHomeVC.m
//  MyTemplateProject
//
//  Created by Pro on 17/5/19.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFHomeVC.h"
#import "LFRecommendVC.h"
#import "LFCourseManagerVC.h"
#import "LFCouponVC.h"
#import "LFOrganVC.h"
#import "LFVideoClassVC.h"
#import "LFTrusteeshipVC.h"
#import "LFSearchBar.h"
#import "LFSummaryViewController.h"
@interface LFHomeVC ()

@end

@implementation LFHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
    
}



- (void)setupNavBar
{
    //设置左边按钮
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(-10, 0, 50, 44)];
    label.text = @"深圳";
    [label sizeToFit];
    label.frame = CGRectMake(-10, 0, label.frame.size.width, 44);
    label.font = FONT(15.0);
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    UIView *organView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, label.frame.size.width + 10, 44)];
    organView.backgroundColor = [UIColor clearColor];

    [organView addSubview:label];

    UIButton *imageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    imageBtn.frame = CGRectMake(label.frame.size.width - 10, 12, 20, 20);
    [imageBtn setImage:[UIImage imageNamed:@"img_white_down"] forState:UIControlStateNormal];
    [imageBtn setImage:[UIImage imageNamed:@"img_white_down"] forState:UIControlStateSelected];
    [organView addSubview:imageBtn];
    
    [organView bk_whenTapped:^{
        DLog(@"点击选择城市");
        
    }];

    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:organView];
    self.navigationItem.leftBarButtonItem = item;
    

    
    //设置搜索栏
    LFSearchBar *searchBar = [[LFSearchBar alloc]initWithFrame:CGRectMake(7, 0, kScreenWidth - 70, 30)];
    searchBar.placeholder = @"搜索面授课、机构、老师";
    searchBar.font = FONT(13);
    searchBar.layer.cornerRadius = 15.0f;
    searchBar.layer.masksToBounds = YES;
    self.navigationItem.titleView = searchBar;
    
    //设置右侧按钮
    
    //扫描View
    UIView * scanView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 24, 44)];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [rightBtn setImage:[UIImage imageNamed:@"icon_scan"] forState:UIControlStateNormal];
    [rightBtn bk_addEventHandler:^(id sender) {
        
        DLog(@"点击了扫描按钮");
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    rightBtn.frame = CGRectMake(5, 12, 20, 20);
    
    [scanView addSubview:rightBtn];

    //消息View

    UIView * rightView = [[UIView alloc] initWithFrame:CGRectMake(5, 0, 32, 44)];
    UIButton *messageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [messageBtn setImage:[UIImage imageNamed:@"message_new_icon"] forState:UIControlStateNormal];
    
    [messageBtn bk_addEventHandler:^(id sender) {
        DLog(@"点击了消息按钮");
        
    } forControlEvents:UIControlEventTouchUpInside];
    messageBtn.frame = CGRectMake(0, 0, 32, 44);
    [rightView addSubview:messageBtn];
    
    
    UIBarButtonItem *item0 = [[UIBarButtonItem alloc]initWithCustomView:scanView];
    UIBarButtonItem *item1 =[[UIBarButtonItem alloc] initWithCustomView:rightView];
    NSArray *itemArr = @[item1,item0];
    self.navigationItem.rightBarButtonItems = itemArr;

    
}
#pragma mark - 重写

- (void)setupChildVcs
{
    
    LFSummaryViewController *vc0 = [LFSummaryViewController new];
    [self addChildViewController:vc0];
    LFRecommendVC *vc1 = [LFRecommendVC new];
    [self addChildViewController:vc1];
    
    LFCourseManagerVC *vc2 = [LFCourseManagerVC new];
    [self addChildViewController:vc2];

    LFCouponVC *vc3 = [LFCouponVC new];
    [self addChildViewController:vc3];

    LFOrganVC *vc4 = [LFOrganVC new];
    [self addChildViewController:vc4];

    LFVideoClassVC *vc5 = [LFVideoClassVC new];
    [self addChildViewController:vc5];

    LFTrusteeshipVC *vc6 = [LFTrusteeshipVC new];
    [self addChildViewController:vc6];

    
}

#pragma mark - Method




@end
