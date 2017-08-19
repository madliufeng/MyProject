//
//  LFRecommendVC.m
//  MyTemplateProject
//
//  Created by Pro on 17/6/1.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFRecommendVC.h"
#import "LFRecommendCollectionViewCell.h"
#import "LFRecommendHeaderView.h"
#import "LFBannerCell.h"
#import "LFBannerAdCell.h"
#import "LFCycleAdView.h"
#import "LFNetworkClient.h"
@interface LFRecommendVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end

static NSString * const reuseIdentifier= @"LFRecommendCollectionViewCell";
static NSString * const HeaderReuseIdentifier= @"LFRecommendHeaderView";
static NSString * const bannerReuseIdentifier= @"LFBannerCell";
static NSString * const bannerAdReuseIdentifier= @"LFBannerAdCell";


@implementation LFRecommendVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"推荐";
    [self setupUI];
    [self loadData];
    
}
#pragma mark - 同时请求多个接口
-(void)loadData{
    
    /**
     重要知识点，同时请求多个接口
     */
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self request1];
        NSLog(@"子线程上的第一个请求");
    });
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self request2];
        
        NSLog(@"子线程上的第二个请求");
    });
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self request3];
        NSLog(@"子线程上的第三个请求");
    });
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self request4];
        NSLog(@"子线程上的第四个请求");
    });
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self request5];
        
        NSLog(@"子线程上的第五个请求");
    });
    // 执行完毕之后的通知
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        
        [self.collectionView reloadData];
        [self.collectionView.mj_header endRefreshing];
        NSLog(@"需要在这里回到主线程刷新UI");
    });
    
}

- (void)request1
{
    //创建信号量并设置计数默认为0
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    
    
    [LFNetworkClient post:@"" params:nil success:^(NSURLSessionDataTask *task, id responseBody) {
        
        //计数+1操作
        dispatch_semaphore_signal(sema);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //计数+1操作
        dispatch_semaphore_signal(sema);
        
    }];
    
    //若计数为0则一直等待
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);

}

- (void)request2
{

}

- (void)request3
{

}

- (void)request4
{

}

- (void)request5
{

}


#pragma  mark - Method
- (void)setupUI
{
    //设置主界面
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerNib:[UINib nibWithNibName:reuseIdentifier bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self.collectionView registerNib:[UINib nibWithNibName:bannerReuseIdentifier bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:bannerReuseIdentifier];
    
    [self.collectionView registerNib:[UINib nibWithNibName:bannerAdReuseIdentifier bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:bannerAdReuseIdentifier];
    
    [self.collectionView registerNib:[UINib nibWithNibName:HeaderReuseIdentifier bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderReuseIdentifier];
    
}


#pragma mark - UICollectionViewDataSource && UICollectionViewDelegate


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 6;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0||section==1) {
        return 1;
    }
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        LFBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:bannerReuseIdentifier forIndexPath:indexPath];
        return cell;
    }else if (indexPath.section ==1){
        LFBannerAdCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:bannerAdReuseIdentifier forIndexPath:indexPath];
        cell.backgroundColor = [UIColor blueColor];
        return cell;
    }else{
        LFRecommendCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        cell.backgroundColor = [UIColor redColor];
        [cell lf_setCornerRadius:6 borderWidth:0 borderColor:nil];
        return cell;
    }
    return nil;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        LFRecommendHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderReuseIdentifier forIndexPath:indexPath];
        
        if (indexPath.section == 2) {
            view.titleLable.text = @"机构推荐";
            
        }else if (indexPath.section==3){
            view.titleLable.text = @"面授课推荐";
            
            
        }else if (indexPath.section ==4){
            view.titleLable.text = @"影课推荐";
            
            
        }else if (indexPath.section ==5){
            view.titleLable.text = @"托管推荐";
            
        }
        return view;
        
    }
    
    return nil;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return UIEdgeInsetsMake(0, 20, 0, 20);
    }
    return UIEdgeInsetsMake(0, 20, 10, 20);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section==0||section==1) {
        return CGSizeZero;
    }else{
        return CGSizeMake(kScreenWidth, 40);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        return CGSizeMake(kScreenWidth, AdaptedWidth(160));
    }else if (indexPath.section == 1){
        return CGSizeMake(kScreenWidth, 60);
    }
    else{
        return  CGSizeMake((kScreenWidth-60)/2, AdaptedWidth(200));
    }
    return CGSizeZero;
}


#pragma  mark - Setter&&Getter

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = .1;
        //cell全部一样可以设置
//        flowLayout.itemSize = CGSizeMake((kScreenWidth-60)/2, WidthScaleSize(200));
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-64-44-49) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        _collectionView.backgroundColor = kVCBackGroundColor;
        
    }
    return _collectionView;
}


@end
