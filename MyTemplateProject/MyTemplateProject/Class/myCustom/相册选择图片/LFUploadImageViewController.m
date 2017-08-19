//
//  LFUploadImageViewController.m
//  MyTemplateProject
//
//  Created by Pro on 17/8/17.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFUploadImageViewController.h"
#import "LFUploadImageTableViewCell.h"

@interface LFUploadImageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mTableView;

@end

static NSString*LFUploadImageTableViewCellId = @"LFUploadImageTableViewCell";

@implementation LFUploadImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mTableView registerNib:[UINib nibWithNibName:LFUploadImageTableViewCellId bundle:[NSBundle mainBundle]] forCellReuseIdentifier:LFUploadImageTableViewCellId];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LFUploadImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LFUploadImageTableViewCellId forIndexPath:indexPath];
    return cell;
}

@end
