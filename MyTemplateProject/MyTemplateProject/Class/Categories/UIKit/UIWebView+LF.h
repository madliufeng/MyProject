//
//  UIWebView+lf.h
//  YDT
//
//  Created by lf on 15/6/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^WebViewContentFrameBlock)(CGRect frame,UIWebView *webView);

@interface UIWebView (LF) <UIWebViewDelegate>

/**
 *  调用 javascript，即时执行
 *
 *  @param jsString js代码
 */
- (void)lf_evaluatingJavaScript:(NSString *)jsString;

- (void)lf_setFrameAdaptWebViewContent:(WebViewContentFrameBlock)webViewContentFrameBlcok;

@end
