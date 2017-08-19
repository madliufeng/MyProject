//
//  NSTimer+lf.h
//  YDT
//
//  Created by lf on 15/6/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (LF)

/**
 *  暂停定时器
 */
- (void)lf_pauseTimer;

/**
 *  恢复定时器
 */
- (void)lf_resumeTimer;

/**
 *  一定时间间隔后，恢复定时器
 *
 *  @param interval 时间间隔
 */
- (void)lf_resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
