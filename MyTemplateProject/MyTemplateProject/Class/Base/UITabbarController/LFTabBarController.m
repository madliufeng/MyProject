//
//  LFTabBarController.m
//  MyTemplateProject
//
//  Created by Pro on 17/5/19.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFTabBarController.h"
#import "LFNavigatonController.h"
#import "LFHomeVC.h"
#import "LFListVC.h"
#import "LFDiscoverVC.h"
#import "LFMineVC.h"
#import "LFTabBar.h"

@interface LFTabBarController ()
@end

@implementation LFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kVCBackGroundColor;
    
    // 设置item属性
    
    [self setupItem];
    
    // 添加所有的子控制器
    [self setupChildViewControllers];
    
    // 处理TabBar
    [self setupTabBar];
}


/**
 * 处理TabBar
 */
- (void)setupTabBar
{
    LFTabBar *tabbar = [[LFTabBar alloc]init];
    tabbar.isNormal = YES;
    [self setValue:tabbar forKeyPath:@"tabBar"];
}


/**
 * 添加所有的子控制器
 */
- (void)setupChildViewControllers
{
    [self setupChildVc:[[LFHomeVC alloc] init] title:@"首页" image:@"lrhicon_home" selectedImage:@"lrhicon_home_highlight"];
    
    [self setupChildVc:[[LFListVC alloc] init] title:@"课堂" image:@"icon_schedule" selectedImage:@"icon_schedule_hightlight"];
    
    [self setupChildVc:[[LFDiscoverVC alloc] init] title:@"发现" image:@"lrhicon_found" selectedImage:@"lrhicon_found_hightlight"];
    
    [self setupChildVc:[[LFMineVC alloc] init] title:@"我" image:@"icon_user" selectedImage:@"icon_user_highlight"];}

/**
 * 添加一个子控制器
 * @param title 文字
 * @param image 图片
 * @param selectedImage 选中时的图片
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 包装一个导航控制器
    LFNavigatonController *nav = [[LFNavigatonController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
    // 设置子控制器的tabBarItem
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


/**
 * 设置item属性
 */
- (void)setupItem
{
    // UIControlStateNormal状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    // 文字颜色
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    // 文字大小
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    // UIControlStateSelected状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    // 文字颜色
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    // 统一给所有的UITabBarItem设置文字属性
    // 只有后面带有UI_APPEARANCE_SELECTOR的属性或方法, 才可以通过appearance对象来统一设置
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

@end
