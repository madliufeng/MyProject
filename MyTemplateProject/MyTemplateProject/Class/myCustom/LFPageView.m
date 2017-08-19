//
//  LFPageView.m
//  OneTutor
//
//  Created by Pro on 17/6/8.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import "LFPageView.h"

@interface LFPageView ()<UIScrollViewDelegate>

@end

@implementation LFPageView
{

    NSInteger _pageNum;
}
//初始化
- (id)initWithFrame:(CGRect)frame
             titles:(NSArray<NSString *> *)titles
              views:(NSArray<__kindof UIView *> *)views
{
    self = [super initWithFrame:frame];
    if (self) {
        _views = views;
        _titleArray = titles;
        self.backgroundColor = [UIColor grayColor];
        [self configData];
        [self configUI];
        
    }
    return self;
}

#pragma mark - 初始化属性

/**
用的时候直接在这个方法修改或者重写这个方法
 */
- (void)configData
{
    self.userInteractionEnabled = YES;
    //菜单按钮背景颜色
    _tabBgColor = [UIColor whiteColor];
    _tabSelectedBgColor = [UIColor whiteColor];
    //中间分割线颜色
    _tabArrowBgColor = [UIColor colorWithHexString:@"dedede"];
    //菜单按钮下的横线
    _tabSelectedArrowBgColor = [UIColor colorWithHexString:@"08ce5b"];


    //标题颜色
    _tabTitleColor = [UIColor colorWithHexString:@"333333"];
    _tabSelectedTitleColor = [UIColor colorWithHexString:@"08ce5b"];
    
    //垂直分割线
    _showVLine = YES;
    //是否显示动画
    _showAnimation = NO;
    //是否显示底部横线
    _showBottomLine = YES;
    //选中状态是否显示底部横线
    _showSelectedBottomLine = YES;
    //是否可以滚动
    _enabledScroll = YES;
    
    _pageControlHeight = 40;
    
    _pageNum = _views.count;
}


#pragma mark - 创建UI
- (void)configUI
{
    //创建头部控件
    
    [self addSubview:self.pageControl];
    
 
    //添加滚动视图
    
    [self addSubview:self.scrollView];
    
   
    if (!_showBottomLine){//默认显示
        CGRect labelFrame = self.bottomLabel.frame;
        labelFrame.size.height = 0;//我改成10了
        self.bottomLabel.frame = labelFrame;
    }
    
    if (!_showSelectedBottomLine) {//默认显示
        CGRect selectedFrame = self.selectedLabel.frame;
        selectedFrame.size.height = 0;
        self.selectedLabel.frame = selectedFrame;
        
    }
    
    if (_enabledScroll) {
        [_scrollView setContentSize:CGSizeMake(kScreenWidth * _views.count , self.frame.size.height)];
    }else{
        [_scrollView setContentSize:CGSizeZero];
    }

 

    [self setupButtons];
    [self.pageControl addSubview:self.bottomLabel];
    
    [self.pageControl addSubview:self.selectedLabel];


}

#pragma mark - 创建按钮
- (void)setupButtons
{
    for (NSInteger i = 0; i < _views.count; i++) {
        //创建主视图
        UIView * view = [_views objectAtIndex:i];
        view.frame = CGRectMake(i*kScreenWidth, 0, kScreenWidth, self.frame.size.height-self.pageControl.frame.size.height);
        [_scrollView addSubview:view];
        
        CGRect _pageframe = _pageControl.frame;
        _pageframe.size.width = kScreenWidth / _pageNum;
        _pageframe.origin.x = _pageframe.size.width * i;
        
        //创建菜单按钮
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:_pageframe];
        button.tag = 100 + i;
        [button setTitleColor:_tabTitleColor forState:UIControlStateNormal];
        [button setTitleColor:_tabSelectedTitleColor forState:UIControlStateSelected];
        [button setBackgroundColor:_tabBgColor];
        [button setTitle:_titleArray[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button addTarget:self action:@selector(tabBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [_pageControl addSubview:button];

        
        //创建菜单右侧小图标
        if (_titleIconsArray.count) {
            [button setImage:_titleIconsArray[i] forState:UIControlStateNormal];
        }
        if (_selectedIconsArray.count) {
            [button setImage:_selectedIconsArray[i] forState:UIControlStateSelected];
        }
        DLog(@"titleLabel.frame:x:%lf width:%lf height:%lf",button.titleLabel.frame.origin.x,button.titleLabel.frame.size.width,button.titleLabel.frame.size.height);
        
        
        //创建菜单按钮右上角的小红点
        UILabel *circleLabel = [[UILabel alloc] initWithFrame:CGRectMake([self getLabelWidth:_titleArray[i] fontSize:15]/2+button.titleLabel.frame.origin.x, 2, 16, 16)];
        circleLabel.backgroundColor = [UIColor redColor];
        circleLabel.textColor = [UIColor whiteColor];
        circleLabel.font = [UIFont systemFontOfSize:12];
        circleLabel.textAlignment = NSTextAlignmentCenter;
        circleLabel.tag = 600 +i;
        circleLabel.layer.cornerRadius = 8;
        circleLabel.layer.masksToBounds = YES;
        circleLabel.clipsToBounds = YES;
        
        if (_tipsCountArray == nil || _tipsCountArray.count == 0) {
            circleLabel.hidden = YES;
        }else if ([_tipsCountArray[i] integerValue] == 0){
            circleLabel.hidden = YES;
        }else{
            circleLabel.hidden = NO;
            circleLabel.text = [_tipsCountArray[i] integerValue]>99?@"99+":[NSString stringWithFormat:@"%@",_tipsCountArray[i]];
            CGPoint center = circleLabel.center;
            
            CGRect cFrame = circleLabel.frame;
            cFrame.size.width = [self getLabelWidth:circleLabel.text fontSize:12]+6>16?[self getLabelWidth:circleLabel.text fontSize:12]+6:16;
            
            circleLabel.frame = cFrame;
            circleLabel.center = center;
        }
        
        
        if (_showVLine) {
            //创建中间分割线
            UILabel *vlabel = [[UILabel alloc] initWithFrame:CGRectMake(-1, 10, 1, button.frame.size.height - 20)];
            vlabel.backgroundColor = _tabArrowBgColor;
            [button addSubview:vlabel];
            
            if (!i) {
                vlabel.hidden = YES;
            }
        }
        
         //设置默认选中的按钮   利用非0即真的特性设置默认为0的  当i = 0时才会进这方法
        
        if (!i) {
            button.selected = YES;
        }
        
       
        if (button.selected) {
            [UIView animateWithDuration:0.3 animations:^{
                //这里是获取不到button中文字的frame
                
                CGRect sframe = self.selectedLabel.frame;
                //46是文字的宽度，这个值是固定的
                sframe.origin.x = button.center.x -46/2;
                
                self.selectedLabel.frame = sframe;
               
               [button setBackgroundColor:_tabSelectedBgColor];
            }];
        }
        [button addSubview:circleLabel];
    }

}

#pragma mark - 计算文字宽度
- (NSInteger)getLabelWidth:(NSString *)string fontSize:(CGFloat)size
{
    CGSize stringSize = [string sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]}];
    CGFloat width = stringSize.width;
    return width;
}

#pragma mark - Action

#pragma mark - 按钮的点击事件

- (void)tabBtnClicked:(UIButton *)sender
{
    NSInteger index = sender.tag - 100;
    
    if (_showAnimation) {
        [UIView beginAnimations:@"navTab" context:nil];
        [UIView setAnimationDuration:0.3];
        [self setSelectIndex:index];
        _scrollView.contentOffset = CGPointMake(index * self.frame.size.width, 0);
        [UIView commitAnimations];
    }else{
        [self setSelectIndex:index];
        _scrollView.contentOffset = CGPointMake(index * self.frame.size.width, 0);
    }
}


#pragma mark - 设置选择的按钮索引 触发的方法

- (void)setSelectIndex:(NSInteger)index
{
    _selectIndex = index;  //这是set方法

    
    for (NSInteger i = 0; i<_pageNum; i++) {
        UIButton *btn = (UIButton *)[self viewWithTag:i + 100];
        btn.backgroundColor = _tabBgColor;
        btn.selected = NO;
    }
    
    UIButton *button = (UIButton *)[_pageControl viewWithTag:index + 100];
    UILabel *selectedLabel = (UILabel *)[_pageControl viewWithTag:300];
    button.backgroundColor = _tabSelectedBgColor;
    button.selected = YES;
    
    if (_showAnimation) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect sframe = selectedLabel.frame;
            sframe.origin.x = button.titleLabel.frame.origin.x +button.frame.origin.x;
            sframe.size.width = button.titleLabel.frame.size.width;
            selectedLabel.frame = sframe;
            
            _scrollView.contentOffset = CGPointMake(index * self.frame.size.width, 0);
            
        }];
    }else{
        CGRect sframe = selectedLabel.frame;
        sframe.origin.x = button.titleLabel.frame.origin.x +button.frame.origin.x;
        sframe.size.width = button.titleLabel.frame.size.width;
        selectedLabel.frame = sframe;
        
        _scrollView.contentOffset = CGPointMake(index * self.frame.size.width, 0);
        
    }
    if(_block){
        _block(self,index);
    }

}

#pragma mark -  getter

- (UIView *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, self.pageControlHeight)];
        _pageControl.backgroundColor = [UIColor whiteColor];

    }
    
    return _pageControl;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        //创建滚动视图
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, self.pageControl.frame.size.height, kScreenWidth, self.frame.size.height)];
        _scrollView.userInteractionEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
//        _scrollView.directionalLockEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.backgroundColor = [UIColor blueColor];
        _scrollView.delegate = self;

    }
    return _scrollView;
}

#pragma mark - 跟随滚动下划线
- (UILabel *)selectedLabel
{
    if (!_selectedLabel) {
        _selectedLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _pageControl.frame.size.height -10, 46, 2)];
        _selectedLabel.backgroundColor = _tabSelectedArrowBgColor;
        _selectedLabel.tag = 300;
      
    }
    return _selectedLabel;
}

#pragma mark - 分割线
- (UILabel *)bottomLabel
{
    if (!_bottomLabel) {
        _bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,  self.pageControl.frame.size.height-1, self.pageControl.frame.size.width, 1)];
        _bottomLabel.backgroundColor = [UIColor colorWithHexString:@"dedede"];
        _bottomLabel.tag = 200;
    }
    return _bottomLabel;
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/self.frame.size.width;
    [self setSelectIndex:index];
}

#pragma mark - 以下接口暂时不完善 可看情况修改
- (void)setPageControlHeight:(CGFloat)pageControlHeight
{
    _pageControlHeight = pageControlHeight;
    //    [self setupUI];
}

- (void)setTabSelectedArrowBgColor:(UIColor *)tabSelectedArrowBgColor
{
    _tabSelectedArrowBgColor = tabSelectedArrowBgColor;
    self.selectedLabel.backgroundColor = tabSelectedArrowBgColor;
}

- (void)setTabBgColor:(UIColor *)tabBgColor
{
    _tabBgColor = tabBgColor;
}

-(void)setTabSelectedBgColor:(UIColor *)tabSelectedBgColor
{
    _tabSelectedBgColor = tabSelectedBgColor;
}

- (void)setTabTitleColor:(UIColor *)tabTitleColor
{
    _tabTitleColor = tabTitleColor;
}

- (void)setTabSelectedTitleColor:(UIColor *)tabSelectedTitleColor
{
    _tabSelectedTitleColor = tabSelectedTitleColor;
}


- (void)setShowVLine:(BOOL)showVLine
{
    _showVLine = showVLine;
}

- (void)setShowBottomLine:(BOOL)showBottomLine
{
    _showBottomLine = showBottomLine;
}

- (void)setShowSelectedBottomLine:(BOOL)showSelectedBottomLine
{
    _showSelectedBottomLine = showSelectedBottomLine;
    
}

- (void)setShowAnimation:(BOOL)showAnimation
{
    _showAnimation = showAnimation;
}

-(void)setEnabledScroll:(BOOL)enabledScroll
{
    _enabledScroll = enabledScroll;
}

@end
