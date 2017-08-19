//
//  LFSearchBar.m
//  MyTemplateProject
//
//  Created by Pro on 17/5/20.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFSearchBar.h"

@implementation LFSearchBar

+ (instancetype)searchBar
{
    return [[self alloc]init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.font = [UIFont systemFontOfSize:15];
    self.placeholder = @"学习周刊";
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [self setBackgroundColor:[UIColor colorWithHexString:@"ffffff"]];
    self.layer.cornerRadius = 5.0f;
    self.layer.masksToBounds = YES;
    self.returnKeyType = UIReturnKeySearch;
    
    // 提前在Xcode上设置图片中间拉伸
//    self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
    
    // 通过init初始化的控件大多都没有尺寸
    UIView *leftview = [[UIView alloc] initWithFrame:CGRectMake(0, 5, 30, 20)];
    UIImageView *searchIcon = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 20, 20)];
    searchIcon.image = [UIImage imageNamed:@"icon_07"];

    [leftview addSubview:searchIcon];
    // contentMode：default is UIViewContentModeScaleToFill
    self.leftView = leftview;
    self.leftViewMode = UITextFieldViewModeAlways;
}
@end
