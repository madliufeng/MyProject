//
//  LFBaseAPI.h
//  MyTemplateProject
//
//  Created by Pro on 17/8/15.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFNetworkClient.h"

@interface LFBaseAPI : NSObject

//@property (nonatomic, assign) NetworkCodeType code;

@property (nonatomic, strong) NSString *msg;

@property (nonatomic, strong) NSMutableDictionary *parameters;

@property (nonatomic, strong) NSArray *uploadFile;

@property (nonatomic, copy) NSString *subUrl;

@end
