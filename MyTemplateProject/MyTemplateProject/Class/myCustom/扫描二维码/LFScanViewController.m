//
//  LFScanViewController.m
//  MyTemplateProject

//  Created by Pro on 17/8/16.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFScanViewController.h"
#import "LFQRCodeTool.h"
@interface LFScanViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

/**
 上下扫描横线
 */
@property (nonatomic, strong) UIImageView *lineView;

/**
 扫描view
 */
@property (nonatomic, strong) UIView *scanView;


@end

@implementation LFScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
    [self setupUI];
    [self beginScan];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)setupUI
{
    //壹家教扫描的背景图
//    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,kScreenWidth,kScreenHeight)];
    //scan_bg  //scan_green_line
//    imageView.image = [UIImage imageNamed:@"scan_bg_beijian"];
//    [self.view addSubview:imageView];
    [self.view addSubview:self.scanView];
    
    [_scanView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(200);
    }];
    
}

- (void)beginScan
{
    LFQRCodeTool *tool = [[LFQRCodeTool alloc]init];
    tool.isDrawQRCodeRect = YES;
    [tool beginScanInView:self.scanView result:^(NSArray<NSString *> *resultStrs) {
        NSLog(@"-----开始扫描");
        NSLog(@"-----%@",resultStrs);
    }];

}

- (void)setupNav
{
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"相册" style:UIBarButtonItemStylePlain target:self action:@selector(btnPhoto:)];
    
    self.navigationItem.rightBarButtonItem = rightBarButton;
}

- (void)btnPhoto:(UIButton *)button
{
    //没有判断权限
    [self openLocalPhoto];
}

- (UIView *)scanView
{
    if (!_scanView) {
        _scanView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        _scanView.backgroundColor = kGrayColor;
   
    }
    return _scanView;
}


#pragma mark -  打开相册
- (void)openLocalPhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    picker.allowsEditing = YES;
    
    [self presentViewController:picker animated:YES completion:nil];
}

//当选择一张图进入这里
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    __block UIImage* image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    if (!image){
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc
{
    NSLog(@"被释放了");
}
@end
