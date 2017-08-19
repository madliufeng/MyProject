//
//  UIWebView+lf.m
//  YDT
//
//  Created by lf on 15/6/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "UIWebView+LF.h"

static const int block_key;

@implementation UIWebView (LF)

/**
 *  调用 javascript，即时执行
 *
 *  @param jsString js代码
 */
- (void)lf_evaluatingJavaScript:(NSString *)jsString {
    [self stringByEvaluatingJavaScriptFromString:[NSString stringWithFormat:
                                                  @"var script = document.createElement('script');"
                                                  "script.type = 'text/javascript';"
                                                  "script.text = \"function myFunction() { "
                                                  "%@"
                                                  "}\";"
                                                  "document.getElementsByTagName('head')[0].appendChild(script);", jsString]];
    
    [self stringByEvaluatingJavaScriptFromString:@"myFunction();"];
}

- (void)lf_setFrameAdaptWebViewContent:(WebViewContentFrameBlock)webViewContentFrameBlcok {
    
    self.delegate = self;
    
    objc_setAssociatedObject(self, &block_key, webViewContentFrameBlcok, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    //
    
    CGRect frame = webView.frame;
    frame.size.height = 1;
    
    webView.scrollView.scrollEnabled = NO;
    webView.frame = frame;
    
    frame.size.height = webView.scrollView.contentSize.height;
    
    NSLog(@"frame = %@", [NSValue valueWithCGRect:frame]);
    webView.frame = frame;
    
    WebViewContentFrameBlock webViewFrameBlock = objc_getAssociatedObject(self, &block_key);
    
    !webViewFrameBlock?:webViewFrameBlock(frame,webView);
    
}


@end
