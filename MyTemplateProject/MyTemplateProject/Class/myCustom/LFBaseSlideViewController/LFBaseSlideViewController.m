//
//  LFBaseSlideViewController.m
//  MyTemplateProject
//
//  Created by Pro on 17/6/1.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFBaseSlideViewController.h"
#import "LFTitleScrollView.h"
@interface LFBaseSlideViewController ()

@property (nonatomic, strong)LFTitleScrollView *titleView;
@property (nonatomic, strong)UIScrollView *scrollView;
@end

@implementation LFBaseSlideViewController

- (NSArray *)titles
{
    if (!_titles ) {
        _titles = @[@"知识总结",@"推荐",@"面授课",@"优惠",@"机构",@"影课",@"托管"];
    }
    return _titles;
}

- (void)isScrollenable:(BOOL)isScrollenable
{
    _isScrollenable = isScrollenable;
    self.titleView.scrollEnabled = isScrollenable;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子控制器
    [self setupChildVcs];

    //设置内容滚动
    [self setupScrollView];
    
    //设置标题按钮滚动
    [self setupTitlesView];

}

- (void)setupChildVcs
{
    for (int i = 0; i<=7; i++) {
        UIViewController *vc = [UIViewController new];
        [self addChildViewController:vc];
    }
    
}

- (void)setupScrollView
{
    // 不要自动调整scrollView的contentInset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 44, kScreenWidth, kScreenHeight-64-44-49);
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
    // 标签栏整体
    self.titleView = [[LFTitleScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
    self.titleView.backgroundColor = [UIColor colorWithHexString:@"08ce5b"];
   
    self.titleView.titles = self.titles;
    
    WEAK_SELF();
    weakSelf.titleView.blcok = ^(NSInteger index){
        [weakSelf.scrollView setContentOffset:CGPointMake(index*weakSelf.view.width, 0) animated:YES];
    };
    
    [self.view addSubview:self.titleView];
    
    
    //    self.titlesView = titlesView;
    
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




@end
