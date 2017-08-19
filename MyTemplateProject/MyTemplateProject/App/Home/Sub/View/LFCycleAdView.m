//
//  LFCycleAdView.m
//  MyTemplateProject
//
//  Created by Pro on 17/6/2.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFCycleAdView.h"

@implementation LFCycleAdView


+ (instancetype)cycleAdView
{
    LFCycleAdView *view = [[[NSBundle mainBundle]loadNibNamed:@"LFCycleAdView" owner:self options:nil]firstObject];
    return view;
}

@end
