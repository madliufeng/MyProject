//
//  NSTimer+lf.m
//  YDT
//
//  Created by lf on 15/6/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "NSTimer+LF.h"

@implementation NSTimer (LF)

/**
 *  暂停定时器
 */
-(void)lf_pauseTimer {
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate distantFuture]];
}

/**
 *  恢复定时器
 */
-(void)lf_resumeTimer {
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate date]];
}

/**
 *  一定时间间隔后，恢复定时器
 *
 *  @param interval 时间间隔
 */
- (void)lf_resumeTimerAfterTimeInterval:(NSTimeInterval)interval {
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end
