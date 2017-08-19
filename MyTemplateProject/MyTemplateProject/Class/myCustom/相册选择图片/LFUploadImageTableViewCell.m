//
//  LFUploadImageTableViewCell.m
//  MyTemplateProject
//
//  Created by Pro on 17/8/17.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFUploadImageTableViewCell.h"
#import "LFUploadImageCollectionViewCell.h"
#import "cameraHelper.h"

@interface LFUploadImageTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *mCollectionView;
@property (nonatomic, strong) NSMutableArray *mDataSource;
@end

static NSString *const LFUploadImageCollectionViewCellId = @"LFUploadImageCollectionViewCell";
@implementation LFUploadImageTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.mCollectionView.delegate = self;
    self.mCollectionView.dataSource = self;
    self.mCollectionView.backgroundColor = kRedColor;
    [self.mCollectionView registerNib:[UINib nibWithNibName:LFUploadImageCollectionViewCellId bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:LFUploadImageCollectionViewCellId];
}

#pragma mark - Method

- (void)selectPhoto
{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"上传图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alertVc addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (![cameraHelper checkCameraAuthorizationStatus]) {
            return ;
        }
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = NO;//设置可编辑
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self.superview.viewController presentViewController:picker animated:YES completion:nil];//进入照相界面

    }]];
    [alertVc addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [cameraHelper checkPhotoLibraryAuthorizationStatus];
    }]];
    [alertVc addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        
    }]];
    [self.superview.viewController presentViewController:alertVc animated:YES completion:nil];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.mDataSource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LFUploadImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LFUploadImageCollectionViewCellId forIndexPath:indexPath];
    cell.bgImageView.image = [UIImage imageNamed:self.mDataSource[indexPath.row]];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((kScreenWidth-4*20)/3, (kScreenWidth-4*20)/3);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 20, 10, 20);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
     //添加图片
    if (indexPath.item == self.mDataSource.count -1) {
        [self selectPhoto];
    }else {
     // 浏览图片
//        MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
//        browser.displayActionButton = NO;
//        browser.displayNavArrows = YES;
//        browser.displaySelectionButtons = NO;
//        browser.alwaysShowControls = NO;
//        browser.zoomPhotosToFill = YES;
//        browser.enableGrid = NO;
//        browser.startOnGrid = NO;
//        browser.enableSwipeToDismiss = YES;
//        browser.autoPlayOnAppear = NO;
//        [browser setCurrentPhotoIndex:indexPath.row];
//        
//        [self.viewController.navigationController pushViewController:browser animated:YES];

    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.superview.viewController dismissViewControllerAnimated:YES completion:nil];
}

- (NSMutableArray *)mDataSource
{
    if (!_mDataSource) {
        _mDataSource = [NSMutableArray arrayWithObject:@"img_add_lightgray"];
    }
    return _mDataSource;
}
@end
