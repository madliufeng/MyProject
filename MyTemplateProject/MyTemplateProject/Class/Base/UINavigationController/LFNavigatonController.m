//
//  LFNavigatonController.m
//  MyTemplateProject
//来源百思不得姐项目
//  Created by Pro on 17/5/19.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFNavigatonController.h"

@interface LFNavigatonController ()<UIGestureRecognizerDelegate>

@end

@implementation LFNavigatonController

+ (void)initialize
{
//    /** 设置UINavigationBar */
//    UINavigationBar *bar = [UINavigationBar appearance];
//    // 设置背景
//    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
//    // 设置标题文字属性
//    NSMutableDictionary *barAttrs = [NSMutableDictionary dictionary];
//    barAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
//    [bar setTitleTextAttributes:barAttrs];
//    
//    /** 设置UIBarButtonItem */
//    UIBarButtonItem *item = [UIBarButtonItem appearance];
//    
//    // UIControlStateNormal
//    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
//    normalAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
//    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
//    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
//    
//    // UIControlStateDisabled
//    NSMutableDictionary *disabledAttrs = [NSMutableDictionary dictionary];
//    disabledAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
//    [item setTitleTextAttributes:disabledAttrs forState:UIControlStateDisabled];
    [self setNavBar];
    
    
}


+ (void)setNavBar {
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setBackgroundImage:[self createImageWithColor:[UIColor colorWithHexString:@"08ce5b"]] forBarMetrics:UIBarMetricsDefault];
    
    if ([UINavigationBar instancesRespondToSelector:@selector(setShadowImage:)]) {
        [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    }
    
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont fontWithName:@"Menlo Regular" size:17],NSFontAttributeName,shadow,NSShadowAttributeName, nil]];
}

+(UIImage* )createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.interactivePopGestureRecognizer.delegate = self;
    
    //    // 设置背景
    //    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    //
    //    // 设置标题文字属性
    //    NSMutableDictionary *barAttrs = [NSMutableDictionary dictionary];
    //    barAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    //    [self.navigationBar setTitleTextAttributes:barAttrs];
}

/**
 * 拦截所有push进来的子控制器
 * @param viewController 每一次push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //    if (不是第一个push进来的子控制器) {
    if (self.childViewControllers.count >= 1) {
        // 左上角的返回
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backButton setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
        [backButton setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateHighlighted];
        [backButton sizeToFit];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        viewController.hidesBottomBarWhenPushed = YES; // 隐藏底部的工具条
    }
    
    // 设置子控制器的颜色
    //    viewController.view.backgroundColor = XMGCommonBgColor;
    
    // super的push方法一定要写到最后面
    // 一旦调用super的pushViewController方法,就会创建子控制器viewController的view
    // 也就会调用viewController的viewDidLoad方法
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - <UIGestureRecognizerDelegate>
/**
 * 每当用户触发[返回手势]时都会调用一次这个方法
 * 返回值:返回YES,手势有效; 返回NO,手势失效
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 如果当前显示的是第一个子控制器,就应该禁止掉[返回手势]
    //    if (self.childViewControllers.count == 1) return NO;
    //    return YES;
    return self.childViewControllers.count > 1;
}


@end
