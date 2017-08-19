//
//  UIAlertView+lf.h
//  YDT
//
//  Created by lf on 15/6/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (LF)

/**
 *  显示简单弹窗，消息
 *
 *  @param message 消息
 */
+ (void)lf_showWithMessage:(NSString *)message;

/**
 *  显示简单弹窗，标题 + 内容
 *
 *  @param title   标题
 *  @param message 内容
 */
+ (void)lf_showWithTitle:(NSString *)title message:(NSString *)message;

/**
 *  显示简单弹窗，标题 + 内容 + 代理
 *
 *  @param title    标题
 *  @param message  内容
 *  @param delegate 代理
 */
+ (void)lf_showWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate;

/**
 *  显示简单弹窗，标题 + 内容 + 代理 + tag
 *
 *  @param title    标题
 *  @param message  内容
 *  @param delegate 代理
 *  @param tag      tag
 */
+ (void)lf_showWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate tag:(int)tag;

@end
