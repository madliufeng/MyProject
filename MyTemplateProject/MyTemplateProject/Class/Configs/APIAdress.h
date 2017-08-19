//
//  APIAdress.h
//  MyTemplateProject
//
//  Created by Pro on 17/5/16.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#ifndef APIAdress_h
#define APIAdress_h

#define serverTag 1

#if serverTag == 1


#pragma mark===================正式服务器========================
//**********************壹家教正式**********************
#define ZHIFUBAOnotifyURL   @"http://gateway.one.kocla.com/onehour_gateway/zhiFuBaoZhiFuNotify"
#define NOTIFY_URL          @"http://gateway.one.kocla.com/onehour_gateway/weiXinZhiFuNotify"
#define SeverHost           @"http://gateway.one.kocla.com/onehour_gateway/"
#define EaseMobSever        @"kocla#onehourgateway"//正式key
#define EaseKeFu @"kypxxzckbj"
/***********微店正式环境***************/
#define WDSeverHost           @"http://v.kocla.com/app"//正式环境
#define WDNOTIFY_ALIPAY_URL   @"http://v.kocla.com/app/zhifubao/async"//正式环境支付宝回调
#define WDNOTIFY_WEXINPAY_URL @"http://v.kocla.com/app/pay/async"//正式环境微信回调
#define WDIMageSeverHost      @"http://7xjew0.com2.z0.glb.qiniucdn.com/"//测试正式环境图片链接
/***********备课正式环境***************/
#define BKSeverHost     @"http://api.beike.kocla.com:8080/marketGateway/"//正式环境
#define RUANKOSEVERHOST @"http://open.kocla.com/knowresource/"//备课文件夹专用
/**************软酷正式环境*************/
#define RKSeverHost @"http://mz.kocla.com/"

#define BEIKEXIAOER @"123456789"
#define MEIRIYITI @"60028028"
#define MEIRIKEJIYITI @"2852"
#define YIZHOUYIQUAN @"60034979"
#define YIZHOUSHIPU @"10153038"
#define YUANQUGONGGAO @"10101285"

#elif serverTag == 2

#pragma mark===================演示服务器========================
//**********************壹家教演示**********************
#define ZHIFUBAOnotifyURL   @"http://218.17.158.37:8232/onehour_gateway/zhiFuBaoZhiFuNotify"
#define NOTIFY_URL          @"http://218.17.158.37:8232/onehour_gateway/weiXinZhiFuNotify"
#define SeverHost           @"http://218.17.158.37:8232/onehour_gateway/"
#define EaseMobSever      @"kocla#yijiajiao"//测试key

/***********微店演示环境***************/
#define WDSeverHost           @"http://demowd.kocla.com:8031/app"//演示环境
#define WDNOTIFY_ALIPAY_URL   @"http://demowd.kocla.com:8031/app/zhifubao/async"//演示环境支付宝回调
#define WDNOTIFY_WEXINPAY_URL @"http://demowd.kocla.com:8031/app/pay/async"//演示环境微信宝回调
#define WDIMageSeverHost      @"http://7xjew0.com2.z0.glb.qiniucdn.com/"//测试正式环境图片链接
/***********备课演示环境***************/
#define BKSeverHost     @"http://218.17.158.37:8233/marketGateway/"//演示环境
#define RUANKOSEVERHOST @"http://open.kocla.com/knowresource/"//备课文件夹专用
/**************软酷拉商城演示环境*************/
#define RKSeverHost @"http://mzdemo.kocla.com:8837/"//考拉商城演示环境
#define EaseKeFu @"ommhwznmaq"

#define BEIKEXIAOER @"123456789"
#define MEIRIYITI @"60028028"
#define MEIRIKEJIYITI @"2852"
#define YIZHOUYIQUAN @"60034979"
#define YIZHOUSHIPU @"10153038"
#define YUANQUGONGGAO @"10101285"

#elif serverTag == 3

#pragma mark - ===================测试服务器========================
////**********************壹家教测试**********************
#define SeverHost         @"http://218.17.158.37:8880/onehour_gateway/"
#define ZHIFUBAOnotifyURL @"http://218.17.158.37:8880/onehour_gateway/zhiFuBaoZhiFuNotify"
#define NOTIFY_URL        @"http://218.17.158.37:8880/onehour_gateway/weiXinZhiFuNotify"
#define EaseMobSever      @"kocla#yijiajiao"//测试key
#define EaseKeFu @"ommhwznmaq"
////**********微店测试环境**************
#define WDSeverHost           @"http://testwd.kocla.com/app"
#define WDNOTIFY_ALIPAY_URL   @"http://testwd.kocla.com/app/zhifubao/async"//测试环境支付宝回调
#define WDNOTIFY_WEXINPAY_URL @"http://testwd.kocla.com/app/pay/async"//测试环境支付宝回调
#define WDIMageSeverHost      @"http://7xjew0.com2.z0.glb.qiniucdn.com/"//测试正式环境图片链接
////**********备课测试环境**************
#define BKSeverHost     @"http://218.17.158.37:8880/marketGateway/"//测试环境
#define RUANKOSEVERHOST @"http://113.106.92.109/knowresource/"//备课文件夹专用
//////**********软酷测试环境*************
#define RKSeverHost @"http://mztest.kocla.com/"

#define BEIKEXIAOER @"123456789"
#define MEIRIYITI @"10020402"
#define MEIRIKEJIYITI @"10021185"
#define YIZHOUYIQUAN @"10025815"
#define YIZHOUSHIPU @"10025001"
#define YUANQUGONGGAO @"10025015"


#elif serverTag == 4

#pragma mark - ===================开发服务器========================
////**********************壹家教开发环境**********************
#define SeverHost         @"http://218.17.158.37:8147/onehour_gateway/"
#define ZHIFUBAOnotifyURL @"http://218.17.158.37:8147/onehour_gateway/zhiFuBaoZhiFuNotify"
#define NOTIFY_URL        @"http://218.17.158.37:8147/onehour_gateway/weiXinZhiFuNotify"
#define EaseMobSever      @"kocla#yijiajiao"//测试key
////**********微店开发环境**************
#define WDSeverHost           @"http://testwd.kocla.com/ios"
#define WDNOTIFY_ALIPAY_URL   @"http://testwd.kocla.com/ios/zhifubao/async"//测试环境支付宝回调
#define WDNOTIFY_WEXINPAY_URL @"http://testwd.kocla.com/ios/pay/async"//测试环境支付宝回调
#define WDIMageSeverHost      @"http://7xjew0.com2.z0.glb.qiniucdn.com/"//测试正式环境图片链接
#define WDSeverHost  @"http://devwd.kocla.com/app/" //考拉微店实景开发环境

////**********备课开发环境**************
#define BKSeverHost     @"http://218.17.158.37:8147/marketGateway/"
#define RUANKOSEVERHOST @"http://113.106.92.109/knowresource/"//备课文件夹专用
//////**********软酷开发环境*************
#define RKSeverHost @"http://mztest.kocla.com/"
#define EaseKeFu @"ommhwznmaq"

#define BEIKEXIAOER @"123456789"
#define MEIRIYITI @"10020402"
#define MEIRIKEJIYITI @"10021185"
#define YIZHOUYIQUAN @"10025815"
#define YIZHOUSHIPU @"10025001"
#define YUANQUGONGGAO @"10025015"

#endif


#endif /* APIAdress_h */
