//
//  LFPullDownMenuView.h
//  MyTemplateProject
//
//  Created by Pro on 17/6/7.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LFPullDownMenuViewDelegate <NSObject>

- (UIView *)viewForContenViewdidSelectIndex:(NSInteger)index;

@end
@interface LFPullDownMenuView : UIView

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, weak) id <LFPullDownMenuViewDelegate> delegate;
@end
