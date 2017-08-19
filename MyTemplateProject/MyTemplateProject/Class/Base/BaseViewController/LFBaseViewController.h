//
//  LFBaseViewController.h
//  MyTemplateProject
//
//  Created by Pro on 17/5/31.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
#import "LFBaseProtocol.h"
@interface LFBaseViewController : UIViewController<LFBaseProtocol>
/** 导航条View */
@property (nonatomic, strong) UIView *navBarView;

// 设置导航栏标题
-(void)setNavigationBarTitle:(NSString *)title;


@end
