//
//  LFBaseSlideViewController.h
//  MyTemplateProject
//
//  Created by Pro on 17/6/1.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFBaseViewController.h"
@interface LFBaseSlideViewController : LFBaseViewController<UIScrollViewDelegate>
/**
 * 标题数组
 */

@property (nonatomic, strong) NSArray *titles;
/**
 * 设置标题栏是否可以滚动,默认是yes
 */

@property (nonatomic, assign,setter = isScrollenable:) BOOL isScrollenable;

/**
 * 自控制器(重写这个方法)
 */
- (void)setupChildVcs;

/**
 * 设置头部滚动View
 */
- (void)setupTitlesView;

@end
