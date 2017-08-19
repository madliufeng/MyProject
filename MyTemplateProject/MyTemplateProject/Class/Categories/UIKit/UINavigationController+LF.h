//
//  UINavigationController+lf.h
//  SnowMan
//
//  Created by zhipeng-mac on 16/4/14.
//  Copyright © 2016年 hejing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (LF)

/**
 *  @author hejing
 *
 *  跳转时animated默认为YES
 */

- (void)lf_pushViewControllerWithStoryBoardName:(NSString *)storyBoardName identifier:(NSString *)identifier;

- (void)lf_pushVC:(UIViewController *)viewController;

- (void)lf_popVC;

- (void)lf_popToVC:(UIViewController *)viewController;

- (void)lf_popToRootVC;

@end
