//
//  MBProgressHUD+lf.h
//  Test
//
//  Created by lf on 15/11/29.
//  Copyright © 2015年 lf. All rights reserved.
//


#define EnableMBProgressHUD


#ifdef EnableMBProgressHUD


#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (LF)

/**
 *  显示文本HUD，1.5秒后消失
 *
 *  @param view 要添加到得视图
 *  @param text 文本
 */
+ (void)lf_showTextHUDAddedTo:(UIView *)view text:(NSString *)text;

/**
 * 展示错误信息
 */

+ (void)showError:(NSString *)error toView:(UIView *)view;

/**
 *展示成功信息
 */

+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

/**
 *展示自定义信息
 */

+ (MBProgressHUD *)showMessag:(NSString *)message toView:(UIView *)view;

@end

@interface UIViewController (MBProgressHUD)

/**
 *  显示HUD文本
 *
 *  @param message 文本
 */
- (void)lf_showMBHUDWithMessage:(NSString *)message;

- (void)showHudInView:(UIView *)view hint:(NSString *)hint;

- (void)hideHud;

- (void)showHint:(NSString *)hint;

- (void)showHint:(NSString *)hint yOffset:(float)yOffset;


@end


#endif
