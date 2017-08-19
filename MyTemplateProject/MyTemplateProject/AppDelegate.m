//
//  AppDelegate.m
//  MyTemplateProject
//
//  Created by Pro on 17/5/12.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "AppDelegate.h"
#import "LFTabBarController.h"
#import "LFADViewController.h"
#import "LFNewFeatrueCollectionViewController.h"
@interface AppDelegate ()
@property (nonatomic, assign) BOOL isFirst;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    self.isFirst = YES;
    if (self.isFirst) {
        LFNewFeatrueCollectionViewController *vc = [[LFNewFeatrueCollectionViewController alloc]init];
        self.window.rootViewController = vc;
    }else {
        LFADViewController *vc = [[LFADViewController alloc]init];
        self.window.rootViewController = vc;
    }
//    self.window.rootViewController = [[LFTabBarController alloc]init];
    [self.window makeKeyWindow];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



#pragma mark 自定义跳转不同的页面
////登录页面
-(void)setupLoginViewController
{
//    LogInViewController *logInVc = [[LogInViewController alloc]init];
//    self.window.rootViewController = logInVc;
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
}
//
////首页
-(void)setupHomeViewController
{
//    MPHomeViewController *tabBarController = [[MPHomeViewController alloc] init];
//    [self.window setRootViewController:tabBarController];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
}
//



@end
