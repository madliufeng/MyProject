//
//  LFQRCodeTool.m
//  MyTemplateProject
//  
//  Created by Pro on 17/6/1.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import "LFQRCodeTool.h"
#import <AVFoundation/AVFoundation.h>
typedef void(^ResultBlock)(NSArray<NSString*> *resultStrs);
@interface LFQRCodeTool ()<AVCaptureMetadataOutputObjectsDelegate>

@property(nonatomic,strong)AVCaptureDeviceInput*input;
@property(nonatomic,strong)AVCaptureMetadataOutput*output;
@property(nonatomic,strong)AVCaptureSession*session;
@property(nonatomic,strong)AVCaptureVideoPreviewLayer*prelayer;
@property(nonatomic,copy)ResultBlock resultBlock;

@property(nonatomic,strong)NSMutableArray*deleteTempLayers;

@end
@implementation LFQRCodeTool
//singleton_m(LFQRCodeTool)

- (NSMutableArray *)deleteTempLayers
{
    if (!_deleteTempLayers) {
        _deleteTempLayers = [NSMutableArray array];
        
    }
    return _deleteTempLayers;
}

//输入
- (AVCaptureDeviceInput *)input
{

    if (!_input) {
        //获取摄像头
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        
        //设置为输入设备
        
        _input = [[AVCaptureDeviceInput alloc]initWithDevice:device error:nil];
    }
    
    return _input;
}



//输出
-(AVCaptureMetadataOutput *)output
{
    if (!_output) {
        //设置元数据输出
        _output = [[AVCaptureMetadataOutput alloc]init];
        //设置输出处理者
        [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    }
    
    return _output;
}

//session

- (AVCaptureSession *)session
{
    if (!_session) {
        //创建会话，并设置输入输出
        _session = [[AVCaptureSession alloc]init];
    }
    return _session;
}

//预览层

- (AVCaptureVideoPreviewLayer *)prelayer
{
    if (!_prelayer) {
        _prelayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:self.session];
    }
    return _prelayer;
}

///开始扫描,并添加预览层到指定视图,扫描结果通过block返回
- (void)beginScanInView:(UIView*)view result:(void(^)(NSArray<NSString*> *resultStrs))resultBlock
{
    self.resultBlock = resultBlock;
    
    //4.创建并设置会话
    
    if ([self.session canAddInput:self.input]&&[self.session canAddOutput:self.output]) {
        [self.session addInput:self.input];
        [self.session addOutput:self.output];
        NSLog(@"test");
        //设置元数据处理类型(注意,一定要将设置元数据处理类型的代码添加到 会话添加输出之后)
        [self.output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];

    }else{
        resultBlock(nil);
        return;
    }
    
    //添加预览图层
    if(![view.layer.sublayers containsObject:self.prelayer])
    {
        self.prelayer.frame= view.layer.bounds;

        [view.layer insertSublayer:self.prelayer atIndex:0];
        NSLog(@"-----%@",NSStringFromCGRect(self.prelayer.frame));

    }
    
    // 5.启动会话
    [self.session startRunning];


}

- (void)stopScan
{
    [self.session stopRunning];
}

-(void)setInsteretRect:(CGRect)originRect
{
    //设置兴趣点
    //注意:兴趣点的坐标是横屏状态(0, 0代表竖屏右上角, 1,1代表竖屏左下角)
    
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    
    CGFloat x = originRect.origin.x/ screenBounds.size.width;
    CGFloat y = originRect.origin.y/ screenBounds.size.height;
    CGFloat width = originRect.size.width/ screenBounds.size.width;
    CGFloat height = originRect.size.height/ screenBounds.size.height;
    
    self.output.rectOfInterest=CGRectMake(y, x, height, width);
}

#pragma mark - AVCaptureMetadataOutputObjectsDelegate

- (void)captureOutput:(AVCaptureOutput*)captureOutput didOutputMetadataObjects:(NSArray*)metadataObjects fromConnection:(AVCaptureConnection*)connection
{
    if(self.isDrawQRCodeRect) {
        [self removeShapLayers];
    }
    NSMutableArray*resultStrs = [NSMutableArray array];
    for(AVMetadataMachineReadableCodeObject*obj in metadataObjects)
    {
        [resultStrs addObject:obj.stringValue];
        
        if(self.isDrawQRCodeRect) {
            // obj中的四个角,是没有转换后的角,需要我们使用预览图层转换
            AVMetadataMachineReadableCodeObject*tempObj = (AVMetadataMachineReadableCodeObject*)[self.prelayer transformedMetadataObjectForMetadataObject:obj];
            [self addShapLayers:tempObj];
            
        }
        
    }
    
    self.resultBlock(resultStrs);
    
    
}

//添加二维码边框图层
- (void)addShapLayers:(AVMetadataMachineReadableCodeObject*)transformObj
{
    //绘制边框
    CAShapeLayer*layer = [CAShapeLayer layer];
    layer.strokeColor= [UIColor redColor].CGColor;
    layer.lineWidth=6;
    layer.fillColor= [UIColor clearColor].CGColor;
    
    //创建一个贝塞尔曲线
    UIBezierPath*path = [[UIBezierPath alloc]init];
    
    
    int index =0;
    for(NSDictionary*pointDic in transformObj.corners)
    {
        CFDictionaryRef dic = (__bridge CFDictionaryRef)(pointDic);
        CGPoint point =CGPointZero;
        CGPointMakeWithDictionaryRepresentation(dic, &point);
        if(index ==0) {
            [path moveToPoint:point];
        }else
        {
            [path addLineToPoint:point];
        }
        index ++;
        
    }
    [path closePath];
    layer.path= path.CGPath;
    [self.prelayer addSublayer:layer];
    [self.deleteTempLayers addObject:layer];
}

//移除二维码边框图层
- (void)removeShapLayers
{
    //移除图层
    for(CALayer*layer in self.deleteTempLayers) {
        [layer removeFromSuperlayer];
    }
    
    [self.deleteTempLayers removeAllObjects];
    
}

- (void)dealloc
{
    NSLog(@"工具被释放了");
}
@end
