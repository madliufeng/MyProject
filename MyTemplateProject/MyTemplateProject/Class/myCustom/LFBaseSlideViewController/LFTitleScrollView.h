//
//  LFTitleScrollView.h
//  MyTemplateProject
//
//  Created by Pro on 17/5/26.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^selectBlcok)(NSInteger index);

@interface LFTitleScrollView : UIScrollView

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) UIView *whiteView;
@property (nonatomic, copy) selectBlcok blcok;

- (void)selectIndex:(NSInteger)index;


@end
