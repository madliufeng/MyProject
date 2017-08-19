//
//  LFUploadImageCollectionViewCell.m
//  MyTemplateProject
//
//  Created by Pro on 17/8/17.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFUploadImageCollectionViewCell.h"

@interface LFUploadImageCollectionViewCell ()

@end

@implementation LFUploadImageCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    //img_add_lightgray
    self.bgImageView.backgroundColor = kGreenColor;
    self.bgImageView.userInteractionEnabled = YES;
}

@end
