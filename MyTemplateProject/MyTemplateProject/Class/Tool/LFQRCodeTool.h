//
//  LFQRCodeTool.h
//  MyTemplateProject
//
//  Created by Pro on 17/6/1.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LFQRCodeTool : NSObject
//singleton_h(LFQRCodeTool)
/*注意这个不能使用单利，因为预览图层只会添加一次，下次再进去就看不到*/

//设置是否需要描绘二维码边框
@property(nonatomic,assign)BOOL isDrawQRCodeRect;

//开始扫描
- (void)beginScanInView:(UIView*)view result:(void(^)(NSArray<NSString*> *resultStrs))resultBlock;

//停止扫描
- (void)stopScan;

//设置兴趣点
- (void)setInsteretRect:(CGRect)originRect;

@end
