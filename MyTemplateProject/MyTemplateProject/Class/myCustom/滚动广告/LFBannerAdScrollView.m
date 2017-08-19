//
//  LFBannerAdScrollView.m
//  MyTemplateProject
//
//  Created by Pro on 17/6/2.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFBannerAdScrollView.h"
#import "LFCycleAdView.h"

@interface LFBannerAdScrollView ()<UIScrollViewDelegate>

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation LFBannerAdScrollView
{
    LFCycleAdView *_leftView,*_midView,*_rightView;
    /** 当前显示的是第几个*/
    NSInteger _currentIndex;
    
    /** 图片个数*/
    NSInteger _MaxCount;
    
    UIScrollView * _scrollView;
}


- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = [UIColor redColor];
        [self setupUI];
        /** 设置数量*/
      
       }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor redColor];
        [self setupUI];

    }
    return self;
}

- (void)setupUI
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
    [self addSubview:scrollView];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    _scrollView = scrollView;

    
    LFCycleAdView *leftView = [LFCycleAdView cycleAdView];
    leftView.frame = CGRectMake(0, 0, kScreenWidth, 60);
    LFCycleAdView *midView = [LFCycleAdView cycleAdView];
    midView.frame = CGRectMake(0, 60, kScreenWidth, 60);
    LFCycleAdView *rightView = [LFCycleAdView cycleAdView];
    rightView.frame = CGRectMake(0, 120, kScreenWidth, 60);
    _leftView = leftView;
    _midView = midView;
    _rightView = rightView;
    
    [_scrollView addSubview:leftView];
    [_scrollView addSubview:midView];
    [_scrollView addSubview:rightView];
    
    _scrollView.contentSize = CGSizeMake(0, 60*3);
    [_scrollView setContentOffset:CGPointMake(0, 60) animated:YES];
    
    /** 设置滚动延时时间*/
    _AutoScrollDelay = 0;
    
    //中间view在图片数组中的下标
    _currentIndex = 0;
    
    
}

- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    /** 设置数量*/
    [self setMaxCount:dataArray.count];
    
    [self refreshData];

}

-(void)setMaxCount:(NSInteger)MaxCount
{
    _MaxCount = MaxCount;
    /** 定时器*/
    [self setupTimer];
    
    /** 初始化图片位置*/
}

- (void)setupTimer
{
    _timer = [NSTimer timerWithTimeInterval:_AutoScrollDelay target:self selector:@selector(didScorll) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];

}

- (void)didScorll
{
    _currentIndex ++;
    [self refreshData];
}




#pragma mark - Method

- (void)removeTimer
{
    if (_timer == nil) return;
    [_timer invalidate];
    _timer = nil;
}


- (void)refreshData {
    [self updateSubView:(_currentIndex-1 ) with:0];
    [self updateSubView:_currentIndex with:1];
    [self updateSubView:(_currentIndex+1) with:2];
}

/**
 abstact：根据传入数据修改相对应子视图
 imageName：拼接图片名字
 index：子视图下标
 */
- (void)updateSubView:(NSInteger)currentIndex with:(NSInteger)index {

    
    LFCycleAdView *view = _scrollView.subviews[index];
    
    /**修改子视图显示图片*/
    view.titleLable.text = self.dataArray[(currentIndex + _MaxCount)%_MaxCount];
}


-(void)dealloc
{
    [self removeTimer];
}

#pragma mark - set方法，设置间隔时间

- (void)setAutoScrollDelay:(NSTimeInterval)AutoScrollDelay
{
    _AutoScrollDelay = AutoScrollDelay;
    
    [self removeTimer];
    [self setupTimer];
}

#pragma mark - 滚动代理

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self setupTimer];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//    *计算当前显示的是第几页
    NSInteger subViewIndex = scrollView.contentOffset.y / 60;
    switch (subViewIndex) {
        case 0:  //向下滚
        {
            _currentIndex = ((_currentIndex - 1) % _MaxCount);
            NSLog(@"%ld----",_currentIndex);
            [self refreshData];
        }
            break;
            
        case 2://向上滚
        {
            _currentIndex = ((_currentIndex + 1) % _MaxCount);
            [self refreshData];
        }
            break;
            
        default:
            break;
    }

    [_scrollView setContentOffset:CGPointMake(0, 60) animated:NO];
}


@end
