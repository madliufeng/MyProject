//
//  UIViewController+AOP.m
//  MyTemplateProject
//
//  Created by Pro on 17/5/19.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "UIViewController+AOP.h"
#import <Aspects/Aspects.h>


@implementation UIViewController (AOP)


+ (void)load{
    
    [[self class] aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> info) {
        
        UIViewController *controller = [info instance];
        
        __weak UIViewController *weakController = controller;
        
        if ([NSStringFromClass([controller class]) hasPrefix:@"HJ"] &&
            ![controller isKindOfClass:NSClassFromString(@"HJHomeVC")] &&
            ![controller isKindOfClass:NSClassFromString(@"HJLoginVC")]) {
            
            //tableViewController尾部设置
            if ([controller isKindOfClass:[UITableViewController class]]) {
                
                ((UITableViewController *)controller).tableView.tableFooterView = [UIView new];
            }
            
            // 控制器背景颜色
            [controller.view setBackgroundColor:kVCBackGroundColor];
            
            // 返回按钮
//            XYQButton * backButton = [self aopBackButton];
//            [backButton bk_addEventHandler:^(id sender) {
//                
//                [weakController.navigationController popViewControllerAnimated:YES];
//                
//            } forControlEvents:UIControlEventTouchUpInside];
            
            // 返回首页按钮
//            XYQButton * homePageButton = [self aopHomePageButton];
//            [homePageButton bk_addEventHandler:^(id sender) {
//                
//                [weakController.navigationController popToRootViewControllerAnimated:YES];
//                
//            } forControlEvents:UIControlEventTouchUpInside];
            
//            if ([controller isKindOfClass:NSClassFromString(@"HJRegisterVC")] || [controller isKindOfClass:NSClassFromString(@"HJForgetPwdVC")] ) {
//                controller.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
//            }
//            else {
//                controller.navigationItem.leftBarButtonItems = @[[[UIBarButtonItem alloc]initWithCustomView:backButton], [[UIBarButtonItem alloc]initWithCustomView:homePageButton]];
//            }
        }
        
    } error:NULL];
    
    
    
    
    
    //view will appear 导航栏隐藏控制
    [[self class] aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info, BOOL animated) {
        
        UIViewController *controller = [info instance];
        
        if ([NSStringFromClass([controller class]) hasPrefix:@"HJ"] &&([controller isKindOfClass:NSClassFromString(@"HJPersonCenterTVC")]||[controller isKindOfClass:NSClassFromString(@"HJGoodsDetailVC")])) {
            
            [controller.navigationController setNavigationBarHidden:YES];
        }else{
            
            [controller.navigationController setNavigationBarHidden:NO];
        }
        
    } error:NULL];
    
    //dealloc 观察控制器内存释放
    [[self class] aspect_hookSelector:NSSelectorFromString(@"dealloc") withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> info) {
        
        UIViewController *controller = [info instance];
        
        if ([NSStringFromClass([controller class]) hasPrefix:@"HJ"]) {
            
            //Log 控制器释放
            DDLogInfo(@"%@-------------控制器释放完毕------------",controller);
        }
        
    } error:NULL];

    
}

@end
