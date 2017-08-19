//
//  LFBaseProtocol.h
//  MyTemplateProject
//
//  Created by Pro on 17/6/2.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LFBaseProtocol <NSObject>

@end


@protocol BaseHeaderFooterProtocol <NSObject>

/**
 *  添加头部尾部刷新
 */
- (void)addHeaderAndFooterRefresh;

/**
 *  头部刷新
 */
- (void)headerBeginRefresh;

/**
 *  尾部刷新
 */
- (void)footerBeginRefresh;

/**
 *  列表请求
 */
- (void)listRequest;

/**
 *  加载数据完成
 */
- (void)loadDataFinish:(NSArray *)arr;

/**
 *  结束刷新
 */
- (void)endRefreshing:(BOOL)noMoreData;

/**
 *  获取列表最大页面数
 *
 *  @return 列表最大页面数
 */
- (int)listMaxPageSize;

@end



@protocol BaseModelReadWriteProtocol <NSCoding>

/**
 *  本地文件路径
 *
 *  @return 本地文件路径
 */
+ (NSString *)filePath;

/**
 *  读取本地
 *
 *  @return model
 */
+ (instancetype)read;

/**
 *  写入本地
 */
- (void)write;

@end

