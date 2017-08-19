//
//  LFMyResourceVC.m
//  MyTemplateProject
//
//  Created by Pro on 17/5/20.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFMyResourceVC.h"
#import "LFSearchBar.h"

#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "DLCustomSlideView.h"
#import "DLLRUCache.h"
#import "DLScrollTabbarView.h"
#import "LFTitleScrollView.h"
@interface LFMyResourceVC ()<UITextFieldDelegate,DLCustomSlideViewDelegate,UIScrollViewDelegate>
{
    NSMutableArray *itemArray_;
}
@property (strong, nonatomic) LFSearchBar *searchBar;
@property (strong, nonatomic) UIButton *rightBtn;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) LFTitleScrollView *titleView;
@end

@implementation LFMyResourceVC

#pragma mark - lifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏
    [self setupNavBar];
    
    //添加子控制器
    [self setupChildVcs];
    
    //设置内容滚动
    [self setupScrollView];
    
    //设置标题按钮滚动
    [self setupTitlesView];

}

#pragma mark - Method

- (void)setupNavBar
{
    //设置导航栏标题
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 150, 44);
    [btn setTitle:@"我的资源夹" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    CGFloat imageWidth = CGRectGetWidth(btn.imageView.frame);
    CGFloat labelWidth = CGRectGetWidth(btn.titleLabel.frame);
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+5/2.0, 0, -labelWidth-5/2.0);;
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth-5/2.0, 0, imageWidth+5/2.0);;
    self.navigationItem.titleView = btn;
    
    //设置右边搜索按钮
    UIButton *rightBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 35, 35);
    [rightBtn setImage:[UIImage imageNamed:@"serach_icon"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(searchBtnclicked) forControlEvents:UIControlEventTouchUpInside];
    self.rightBtn = rightBtn;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    
    negativeSpacer.width = - 15;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, rightItem , nil];

}

- (void)setupChildVcs
{
    OneViewController *vc1 = [OneViewController new];
    vc1.view.backgroundColor = kRedColor;
    vc1.title = @"推荐";
    [self addChildViewController:vc1];
    
    TwoViewController *vc2 = [TwoViewController new];
    vc2.view.backgroundColor = kBlueColor;
    vc2.title = @"面授课";
    [self addChildViewController:vc2];

    
    ThreeViewController *vc3 = [ThreeViewController new];
    vc3.view.backgroundColor = kPurpleColor;
    vc3.title = @"优惠";
    [self addChildViewController:vc3];

    
    OneViewController *vc4 = [OneViewController new];
    vc4.view.backgroundColor = kOrangeColor;
    vc4.title = @"机构";
    [self addChildViewController:vc4];

    
    TwoViewController *vc5 = [TwoViewController new];
    vc5.view.backgroundColor = kGrayColor;
    vc5.title = @"影课";
    [self addChildViewController:vc5];

    
    
    ThreeViewController *vc6 = [ThreeViewController new];
    vc6.view.backgroundColor = kGreenColor;
    vc6.title = @"托管";
    [self addChildViewController:vc6];
    



}

- (void)setupScrollView
{
    // 不要自动调整scrollView的contentInset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.backgroundColor = kVCBackGroundColor;
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.width, 0);
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    // 默认显示第0个控制器
    [self scrollViewDidEndScrollingAnimation:self.scrollView];


}

- (void)setupTitlesView
{

    NSArray *titles = @[@"推荐",@"面授课",@"优惠",@"机构",@"影课",@"托管"];
    // 标签栏整体
    self.titleView = [[LFTitleScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
    self.titleView.backgroundColor = [UIColor colorWithHexString:@"08ce5b"];
    self.titleView.frame = CGRectMake(0, 0 , self.view.width, 44);
    self.titleView.titles = titles;
    
    WEAK_SELF();
    weakSelf.titleView.blcok = ^(NSInteger index){
        [weakSelf.scrollView setContentOffset:CGPointMake(index*weakSelf.view.width, 0) animated:YES];
    };
    
    [self.view addSubview:self.titleView];
    
    
//    self.titlesView = titlesView;

}



#pragma mark - Action
//点击导航栏右边按钮
- (void)searchBtnclicked
{
    
    UIButton *sousuoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sousuoBtn.frame = CGRectMake(0, 0, 40, 40);
    [sousuoBtn setTitle:@"搜索" forState:UIControlStateNormal];
    [sousuoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sousuoBtn addTarget:self action:@selector(sousuoBtnDidClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithCustomView:sousuoBtn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = - 10;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, rightBtn, nil];


    
    self.searchBar = [LFSearchBar searchBar];
    self.searchBar = [[LFSearchBar alloc]initWithFrame:CGRectMake(0, 0, 0, 30)];
    self.navigationItem.titleView = self.searchBar;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.searchBar.frame = CGRectMake( 0, 0, kScreenWidth - 110, 30);
    }];

}

//点击搜索
- (void)sousuoBtnDidClicked
{
    DLog(@"待完成");
    [self.searchBar resignFirstResponder];
    if (self.searchBar.text.length != 0) {
        //TODO
    }else
    {
        //TODO
    }
    for (int i = 0; i<6; i++) {
        //TODO
    }
    
}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // 取出对应的子控制器
    int index = scrollView.contentOffset.x / scrollView.width;
    UIViewController *willShowChildVc = self.childViewControllers[index];
    
    // 如果控制器的view已经被创建过，就直接返回
//    if (willShowChildVc.isViewLoaded) return;
    
    // 添加子控制器的view到scrollView身上
    willShowChildVc.view.frame = scrollView.bounds;
    [scrollView addSubview:willShowChildVc.view];
}

/**
 * 当减速完毕的时候调用（人为拖拽scrollView，手松开后scrollView慢慢减速完毕到静止）
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    // 点击按钮
    int index = scrollView.contentOffset.x / scrollView.width;

    [self.titleView selectIndex:index];
}
#pragma mark - Setter&&Getter



@end
