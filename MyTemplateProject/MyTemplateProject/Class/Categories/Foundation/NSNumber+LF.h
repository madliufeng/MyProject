//
//  NSNumber+lf.h
//  Test
//
//  Created by lf on 15/11/30.
//  Copyright © 2015年 lf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (LF)

/**
 *  将 num 四舍五入
 *
 *  @param position 在指定位数四舍五入
 *
 *  @return 新值的字符串
 */
- (NSString *)lf_roundAfterPoint:(int)position;

/**
 *  格式化小数 四舍五入类型
 *
 *  @param format 格式
 *
 *  @return 新值的字符串
 */
- (NSString *)lf_decimalwithFormat:(NSString *)format;

@end
