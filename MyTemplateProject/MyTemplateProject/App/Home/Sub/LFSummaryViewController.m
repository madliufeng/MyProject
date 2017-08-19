//
//  LFSummaryViewController.m
//  MyTemplateProject
//
//  Created by Pro on 17/8/16.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFSummaryViewController.h"
#import "LFScanViewController.h"
#import "LFUploadImageViewController.h"

@interface LFSummaryViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mTableView;
@property (nonatomic, strong) NSArray * mDataSource;
@end

@implementation LFSummaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = YES;
    // Do any additional setup after loading the view from its nib.
    self.mDataSource = @[@"扫描二维码",@"上传图片",@"下拉弹出菜单",@"自定义不等高cell",@"系统UISearchController详解"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        }
    cell.textLabel.text = self.mDataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            LFScanViewController *vc = [[LFScanViewController alloc]init];
            vc.title = self.mDataSource[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            LFUploadImageViewController *vc = [[LFUploadImageViewController alloc]init];
            vc.title = self.mDataSource[indexPath.row];
            [self.navigationController pushViewController:vc animated:YES];

        }
            break;

        case 2:
        {
            
        }
            break;

        case 3:
        {
            
        }
            break;

        case 4:
        {
            
        }
            break;

        case 5:
        {
            
        }
            break;

        case 6:
        {
            
        }
            break;

        case 7:
        {
            
        }
            break;

        case 8:
        {
            
        }
            break;

            
        default:
            break;
    }
}


@end
