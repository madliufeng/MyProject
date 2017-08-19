//
//  LFBannerAdScrollView.h
//  MyTemplateProject
//
//  Created by Pro on 17/6/2.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFBannerAdScrollView : UIView

@property (nonatomic, strong) NSArray *dataArray;

/** 滚动延时*/
@property (nonatomic, assign) NSTimeInterval AutoScrollDelay;

@end
