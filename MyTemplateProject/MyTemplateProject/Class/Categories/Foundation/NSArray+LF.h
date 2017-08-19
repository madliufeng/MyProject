//
//  NSArray+LH.h
//  Cancer
//
//  Created by zhipeng-mac on 16/2/16.
//  Copyright (c) 2016年 hejing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LF)
/**
 *  将数组分割成字符串
 *
 *  @param breakString 截断字符
 *
 *  @return 字符串
 */
- (NSString *)lf_synthetiseStringFromInsideWithBreakString:(NSString *)breakString;

@end
