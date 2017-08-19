//
//  LFRequestConfig.h
//  MyTemplateProject
//
//  Created by Pro on 17/8/15.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFRequestConfig : NSObject

@property (nonatomic,retain) NSString *baseUrl;
@property (nonatomic,retain) NSString *token;
@property (nonatomic,retain) NSString *sig;
@property (nonatomic,retain) NSString *timestamp;

@end
