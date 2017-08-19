//
//  LFAdItem.h
//  MyTemplateProject
//
//  Created by Pro on 17/5/31.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFAdItem : NSObject

// 广告图片
@property (nonatomic, strong) NSString *w_picurl;

// 广告图片尺寸
@property (nonatomic, assign) CGFloat w;

// 广告图片尺寸
@property (nonatomic, assign) CGFloat h;

// 点击广告跳转的界面
@property (nonatomic, strong) NSString *ori_curl;

@end
