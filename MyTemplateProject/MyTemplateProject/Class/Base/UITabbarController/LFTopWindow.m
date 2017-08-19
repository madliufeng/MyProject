//
//  LFTopWindow.m
//  MyTemplateProject
//
//  Created by Pro on 17/5/19.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFTopWindow.h"
#import "LFTopWindowViewController.h"

@implementation LFTopWindow

static UIWindow *window_;

+ (void)initialize
{
    window_ = [[self alloc] init];
}

+ (void)show
{
    window_.hidden = NO;
    window_.backgroundColor = [UIColor clearColor];
}

+ (void)hide
{
    window_.hidden = YES;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.windowLevel = UIWindowLevelAlert;
        self.rootViewController = [[LFTopWindowViewController alloc] init];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    frame = [UIApplication sharedApplication].statusBarFrame;
    [super setFrame:frame];
}
@end
