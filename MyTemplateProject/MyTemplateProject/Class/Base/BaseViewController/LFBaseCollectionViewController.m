//
//  LFBaseCollectionViewController.m
//  MyTemplateProject
//
//  Created by Pro on 17/6/2.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFBaseCollectionViewController.h"


@interface LFBaseCollectionViewController ()

@end

@implementation LFBaseCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

#pragma mark - Init

- (instancetype)init {
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.minimumLineSpacing = .1;
    layout.minimumInteritemSpacing = .1;
    self = [self initWithCollectionViewLayout:layout];
    
    return self;
}


#pragma mark - View Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}];
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // default..
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self configureData];
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Configure

/**
 *  配置数据，启动后自动执行
 */
- (void)configureData {
    
}

/**
 *  配置视图，启动后自动执行
 */
- (void)configureView {
    
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>


#pragma mark - <BaseHeaderFooterProtocol>

- (int)mPageNo {
    if (!_mPageNo) {
        _mPageNo = 1;
    }
    return _mPageNo;
}

- (NSMutableArray *)mData {
    if (!_mData) {
        _mData = [NSMutableArray array];
    }
    return _mData;
}

- (void)addHeaderAndFooterRefresh {
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerBeginRefresh)];
    header.lastUpdatedTimeKey = NSStringFromClass(self.class).lf_md5_32Bit_String;
    self.collectionView.mj_header = header;
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerBeginRefresh)];
    self.collectionView.mj_footer = footer;
}

/**
 *  头部刷新
 */
- (void)headerBeginRefresh {
    [self.mData removeAllObjects];
    self.mPageNo = 1;
    [self listRequest];
}

/**
 *  尾部刷新
 */
- (void)footerBeginRefresh {
    self.mPageNo++;
    [self listRequest];
}

/**
 *  列表请求
 */
- (void)listRequest {
    
}

/**
 *  加载数据完成
 */
- (void)loadDataFinish:(NSArray *)arr {
    // 添加数据
    [self.mData addObjectsFromArray:arr];
    
    BOOL noMoreData = (arr.count == 0 || arr.count < [self listMaxPageSize]);
    [self endRefreshing:noMoreData];
}

/**
 *  结束刷新
 */
- (void)endRefreshing:(BOOL)noMoreData {
    // 取消刷新
    if (self.collectionView.mj_header.isRefreshing) {
        [self.collectionView.mj_header endRefreshing];
    }
    else if (self.collectionView.mj_footer.isRefreshing) {
        [self.collectionView.mj_footer endRefreshing];
    }
    // 判断还有没有数据
    if (noMoreData) {
        [self.collectionView.mj_footer endRefreshingWithNoMoreData];
    }
    else {
        [self.collectionView.mj_footer resetNoMoreData];
    }
    // 数据重载
    [self.collectionView reloadData];
}

/**
 *  获取列表最大页面数
 *
 *  @return 列表最大页面数
 */
- (int)listMaxPageSize {
    static NSInteger const maxPageSize = BSH_PAGESIZE;
    return maxPageSize;
}

@end
