//
//  LFPullDownMenuView.m
//  MyTemplateProject
//
//  Created by Pro on 17/6/7.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFPullDownMenuView.h"

@implementation LFPullDownMenuView
{
    UIView *_bgView;
 
    UIButton *_lastBtn;//记录上一次选择的按钮
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setupBgView];
        
    }
    return self;
}

#pragma mark - Mehtod
- (void)setupBgView
{
    _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, self.bottom, self.width, kScreenHeight-self.bottom)];
    _bgView.backgroundColor = [kGrayColor colorWithAlphaComponent:0.3];
    _bgView.hidden = YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(singlehandle)];
    _bgView.userInteractionEnabled = YES;
    [_bgView addGestureRecognizer:tap];
    
    [self addSubview:_bgView];

}

- (void)dismiss
{
    [UIView animateWithDuration:0.25 animations:^{
        
        self.contentView.frame = CGRectMake(0, self.bottom, kScreenWidth, 0);
        
    } completion:^(BOOL finished) {
        
        _bgView.hidden = YES;
        
    }];
}
#pragma mark - Action
- (void)singlehandle
{

}

- (void)buttonClick:(UIButton *)button
{
    button.selected = !button.selected;
    
    if (_lastBtn != button) {
        _lastBtn.selected = NO;
        
    }
    
    if (button.selected) {
        //先移除其他已经存在的view
        [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        
        //记录上一个button
        _lastBtn = button;
        
        if ([self.delegate respondsToSelector:@selector(viewForContenViewdidSelectIndex:)]) {
            
            UIView *view = [self.delegate viewForContenViewdidSelectIndex:button.tag-100];
            
            [self.contenView addSubview:view];
            
            [UIView animateWithDuration:0.25 animations:^{
                
                self.contentView.frame = CGRectMake(0, self.bottom, kScreenWidth, view.height);
                
            } completion:^(BOOL finished) {
                
            }];
            
            _bgView.hidden = NO;
            
        }
        
    }else{
        
        [self dismiss];
        
    }

}

#pragma mark - Setter && Getter
- (void)setTitles:(NSArray *)titles
{
    _titles = titles;
    
    [_titles enumerateObjectsUsingBlock:^(NSString *  _Nonnull title, NSUInteger idx, BOOL * _Nonnull stop) {
       
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        CGFloat w = self.frame.size.width/3;
        CGFloat h = self.frame.size.height;
        
        button.frame = CGRectMake(idx*w, 0, w, h);
        
        [button setTitle:title forState:UIControlStateNormal];
        button.tag = 100+idx;
        
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitleColor:kBlueColor forState:UIControlStateNormal];
        [button setTitleColor:kRedColor forState:UIControlStateSelected];
        
        button.backgroundColor = kLightGrayColor;
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];

    }];
    
}

- (UIView *)contenView
{
    if (_contentView == nil) {
        _contentView = [[UIView alloc]init];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.frame = CGRectMake(0, self.bottom, self.bounds.size.width, 0);
        _contentView.clipsToBounds = YES;
        [self addSubview:_contentView];
    }
    return _contentView;
}

@end
