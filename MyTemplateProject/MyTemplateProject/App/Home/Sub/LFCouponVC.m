//
//  LFCouponVC.m
//  MyTemplateProject
//
//  Created by Pro on 17/6/1.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFCouponVC.h"
#import "AddressPickerView.h"
#import "UIView+EaseBlankPage.h"
@interface LFCouponVC ()

@end

@implementation LFCouponVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AddressPickerView *pickView = [AddressPickerView shareInstance];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"添加地址选择器" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 200, 35);
    [button bk_whenTapped:^{
        [pickView showAddressPickView];
    }];
//    [self.view addSubview:button];
    [self.view configBlankPage:EaseBlankPageTypeNoButton hasData:NO hasError:NO reloadButtonBlock:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
