//
//  NSDate+lf.m
//  YDT
//
//  Created by lf on 15/6/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "NSDate+LF.h"

@implementation NSDate (LF)

/**
 *  获取日期格式化器
 *
 *  @param dateFormat 指定日期格式
 *
 *  @return 日期格式化器
 */
- (NSDateFormatter *)lf_private_dateFormatter:(NSString *)dateFormat {
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    df.locale = [NSLocale currentLocale];
    df.dateFormat = dateFormat;
    
    return df;
}

/**
 *  获取指定格式字符串
 *
 *  @param dateFormat 日期格式
 *
 *  @return 指定格式字符串
 */
- (NSString *)lf_private_stringWithFormat:(NSString *)dateFormat {
    NSDateFormatter *dateFormatter = [self lf_private_dateFormatter:dateFormat];
    
    return [dateFormatter stringFromDate:self];
}

/**
 *  获取指定格式的显示时间
 *
 *  @param dateFormat 日期格式，比如：yyyy-MM-dd HH:mm:ss
 *
 *  @return 日期字符串
 */
- (NSString *)lf_stringWithFormat:(NSString *)dateFormat {

    return [self lf_private_stringWithFormat:dateFormat];
}

/**
 *  获取 日期+星期 字符串，比如：2011年4月4日 星期一
 *
 *  @return 日期+星期 字符串
 */
- (NSString *)lf_string_yyyyMMdd_EEEE {
    NSString *dateFormat = @"yyyy '-' MM '-' dd ' ' EEEE";
    
    return [self lf_private_stringWithFormat:dateFormat];
}

/**
 *  获取 日期 字符串，比如：2011-4-4
 *
 *  @return 日期 字符串
 */
- (NSString *)lf_string_yyyyMMdd {
    NSString *dateFormat = @"yyyy-MM-dd";
    
    return [self lf_private_stringWithFormat:dateFormat];
}

/**
 *  获取 日期时间 字符串，比如：20151107142223
 *
 *  @return 日期时间 字符串
 */
- (NSString *)lf_string_yyyyMMddHHmmss {
    NSString *dateFormat = @"yyyyMMddHHmmss";
    
    return [self lf_private_stringWithFormat:dateFormat];
}

/**
 *  获取 日期+时间 字符串，比如：2015-11-07 14:22:23
 *
 *  @return 日期+时间 字符串
 */
- (NSString *)lf_string_yyyyMMdd_HHmmss {
    NSString *dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    return [self lf_private_stringWithFormat:dateFormat];
}

- (NSUInteger)lf_YearsFromDate {
    
    NSTimeInterval dateDiff = [self timeIntervalSinceNow];
    
    NSUInteger years=trunc(dateDiff/(60*60*24))/365;
    
    return years;
}

@end
