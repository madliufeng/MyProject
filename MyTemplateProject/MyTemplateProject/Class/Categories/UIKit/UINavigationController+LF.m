//
//  UINavigationController+lf.m
//  SnowMan
//
//  Created by zhipeng-mac on 16/4/14.
//  Copyright © 2016年 hejing. All rights reserved.
//

#import "UINavigationController+LF.h"
#

@implementation UINavigationController (LF)

- (void)lf_pushViewControllerWithStoryBoardName:(NSString *)storyBoardName identifier:(NSString *)identifier {
    
    UIViewController *controller = [UIViewController lf_createFromStoryboardName:storyBoardName WithIdentifier:identifier];
    [self pushViewController:controller animated:YES];
}

- (void)lf_pushVC:(UIViewController *)viewController {
    
    [self pushViewController:viewController animated:YES];
}

- (void)lf_popVC {
    
    [self popViewControllerAnimated:YES];
}

- (void)lf_popToVC:(UIViewController *)viewController {
    
    [self popToViewController:viewController animated:YES];
    
}

- (void)lf_popToRootVC {
    
    [self popToRootViewControllerAnimated:YES];
}

@end
