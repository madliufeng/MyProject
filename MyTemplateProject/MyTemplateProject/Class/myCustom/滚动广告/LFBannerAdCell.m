//
//  LFBannerAdCell.m
//  MyTemplateProject
//
//  Created by Pro on 17/6/2.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFBannerAdCell.h"
#import "LFBannerAdScrollView.h"
@implementation LFBannerAdCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bannerScrollView.dataArray = @[@"1111",@"222222",@"33333",@"44444",@"5555555",@"66666"];
    self.bannerScrollView.AutoScrollDelay = 2.0;
}

@end
