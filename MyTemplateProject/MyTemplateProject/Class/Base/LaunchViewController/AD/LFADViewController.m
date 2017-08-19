//
//  LFADViewController.m
//  MyTemplateProject
//
//  Created by Pro on 17/5/31.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFADViewController.h"
#import "LFAdItem.h"
#import "LFTabBarController.h"


#define BSCode2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

@interface LFADViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UIButton *adButton;
@property (weak, nonatomic)  UIImageView *adView;
@property (nonatomic, strong) LFAdItem *adItem;
@property (nonatomic, weak) NSTimer *timer;



@end

@implementation LFADViewController


- (UIImageView *)adView
{
    if (_adView == nil) {
        UIImageView *imageV = [[UIImageView alloc] init];
        
        [self.view insertSubview:imageV aboveSubview:self.bgImage];
        
        _adView = imageV;
    }
    return _adView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    // 设置背景
    [self setUpBG];
    
    // 加载广告数据,以后加载广告数据，就是跟服务器打交道，查看接口文档。
    
    // cocoapods管理第三方框架,
    // podfile:描述加载哪些框架
    // podlock:pod之后，才会生成，记录最后一次pod，所有第三方库的版本号
    // pod install:第一次根据podfile加载，以后根据podlock加载
    // pod update:每次都会更新podlock，去索引中查找最新的版本
    // pod repo update: 更新pod仓库
    
    // 创建请求会话管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    parameters[@"code2"] = BSCode2;
    
    [mgr GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * _Nullable  responseObject) {
        
        NSDictionary *dict = [responseObject[@"ad"] lastObject];
        
        _adItem = [LFAdItem objectWithKeyValues:dict];
        
        // 设置广告view的尺寸
        if (_adItem.w > 0) {
            
            CGFloat h =  kScreenWidth / _adItem.w * _adItem.h;
            
            self.adView.frame = CGRectMake(0, 0, kScreenWidth, h);
            
            // 加载广告view
            [self.adView sd_setImageWithURL:[NSURL URLWithString:_adItem.w_picurl]];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    // 搞个定时器,控制广告时间
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange:) userInfo:nil repeats:YES];
    
    
    
}

- (void)timeChange:(id)timer
{
    static int i = 3;
    
    NSString *str = [NSString stringWithFormat:@" 跳过（%d）",i];
    [_adButton setTitle:str forState:UIControlStateNormal];
    
    if (i < 0) { // 3秒，销毁当前界面和定时器
        
        [self jump:nil];
    }
    
    i--;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_adItem.ori_curl]];
}

- (void)setUpBG
{
    // 6p : 736 6 : 667  5 : 568  4 : 480
    if (kScreenWidth == 736) {
        
        _bgImage.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
        
    }else if (kScreenWidth == 667){
        
        _bgImage.image = [UIImage imageNamed:@"LaunchImage-800-667h"];
        
    }else if (kScreenWidth == 568){
        
        _bgImage.image = [UIImage imageNamed:@"LaunchImage-700-568h"];
        
    }else if(kScreenWidth == 480){
        
        _bgImage.image = [UIImage imageNamed:@"LaunchImage-700"];
        
    }
    
}


- (IBAction)jump:(UIButton *)sender {
    [_timer invalidate];
    
    LFTabBarController *tabBarVc = [[LFTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVc;
    
}


@end
