//
//  LFTitleScrollView.m
//  MyTemplateProject
//
//  Created by Pro on 17/5/26.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//
#import "LFTitleScrollView.h"


#define Space  20
#define buttonH 40
#define buttonW (kScreenWidth-6*buttonSpace)/5

@implementation LFTitleScrollView
{
    UIButton *_currentBtn;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        if ([self.delegate respondsToSelector:@selector(selectIndex:)]) {
            
        }
    }
    return self;
}


- (void)setTitles:(NSArray *)titles
{
    _titles = titles;
  
    UIView *whiteView = [[UIView alloc]initWithFrame:CGRectMake(20, 10, 50, 24)];
    whiteView.backgroundColor = kWhiteColor;
    [whiteView lf_setCornerRadius:12.0f borderWidth:0 borderColor:nil];
    [self addSubview:whiteView];
   
    self.whiteView = whiteView;
    
   __block CGFloat w = 0;

    [titles enumerateObjectsUsingBlock:^(NSString *  _Nonnull title, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithHexString:@"d3ffe7"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithHexString:@"08ce5b"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(btn_click:) forControlEvents:UIControlEventTouchUpInside];
        button.selected = NO;
        //计算文字宽度
        CGSize size = [title lf_sizeWithFont:FONT(15) constrainedToSize:CGSizeMake(MAXFLOAT, 24)];
        
        CGFloat btnW = size.width+20;
        button.frame = CGRectMake(20+w, 10, btnW, 24);
        
        button.backgroundColor = kClearColor;
        button.tag = 100+idx;
        
        if (button.tag == 100) {
            button.selected = YES;
        }
        
        [self addSubview:button];
        
        w = button.frame.size.width +button.frame.origin.x;
       
        //设置contenSize的大小
        if (idx ==titles.count-1) {
            self.contentSize = CGSizeMake(w+20, 0);
        }
 
    }];
    
    //设置默认值
    _currentBtn  = (UIButton *) [self viewWithTag:100];
    _currentBtn.selected = YES;
    
    CGRect frame = self.whiteView.frame;
    frame.size.width = _currentBtn.width;
    self.whiteView.frame = frame;
  
}

- (void)btn_click:(UIButton *)button
{
     _currentBtn.selected = NO;
    
    button.selected = !button.selected;
    _currentBtn = button;
    _currentBtn.selected = YES;
   
    
    [UIView animateWithDuration:0.25 animations:^{
        self.whiteView.frame = button.frame;
    }];
    
    
    if (button.lf_right >= kScreenWidth) {
        [self setContentOffset:CGPointMake(button.lf_right+20-kScreenWidth, 0) animated:YES];
    }else{
        [self setContentOffset:CGPointMake(0, 0) animated:YES];
    }

    
    if (self.blcok) {
        self.blcok(button.tag-100);
    }
}

- (void)selectIndex:(NSInteger)index
{
    _currentBtn.selected = NO;
    _currentBtn = (UIButton *)[self viewWithTag:index+100];
    _currentBtn.selected = YES;
    
    if (_currentBtn.lf_right >= kScreenWidth) {
        [self setContentOffset:CGPointMake(_currentBtn.lf_right+20-kScreenWidth, 0) animated:YES];
    }else{
        [self setContentOffset:CGPointMake(0, 0) animated:YES];
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        self.whiteView.frame = _currentBtn.frame;
    }];
    
    
}


@end
