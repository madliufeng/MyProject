//
//  LFCourseManagerVC.m
//  MyTemplateProject
//
//  Created by Pro on 17/6/1.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFCourseManagerVC.h"
#import "LFPullDownMenuView.h"
@interface LFCourseManagerVC ()<LFPullDownMenuViewDelegate>

@end

@implementation LFCourseManagerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"面授课";
    [self setupUI];
}

- (void)setupUI
{
    LFPullDownMenuView *view = [[LFPullDownMenuView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 35)];
    view.titles = @[@"a界面",@"b界面",@"c界面"];
    view.delegate = self;
    [self.view addSubview:view];
}

- (UIView *)viewForContenViewdidSelectIndex:(NSInteger)index
{
    switch (index) {
        case 0:
        {
            UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 300)];
            redView.backgroundColor = kRedColor;
            return redView;
            
        }
            break;
        case 1:
        {
            UIView *greenView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 300)];
            greenView.backgroundColor = kGreenColor;
            return greenView;

        }
            break;

        case 2:
        {
            UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 300)];
            blueView.backgroundColor = kBlueColor;
            return blueView;

        }
            break;

            
        default:
            break;
    }
    return nil;
}


@end
