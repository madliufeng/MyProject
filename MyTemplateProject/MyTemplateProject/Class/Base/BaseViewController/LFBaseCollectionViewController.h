//
//  LFBaseCollectionViewController.h
//  MyTemplateProject
//
//  Created by Pro on 17/6/2.
//  Copyright © 2017年 Pro_liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFBaseProtocol.h"

#define BSH_PAGESIZE 5
@interface LFBaseCollectionViewController : UICollectionViewController<UICollectionViewDelegate,UICollectionViewDataSource,BaseHeaderFooterProtocol>

/**
 *  配置数据，启动后自动执行
 */
- (void)configureData;

/**
 *  配置视图，启动后自动执行
 */
- (void)configureView;

#pragma mark - <BaseHeaderFooterProtocol>

@property (nonatomic, assign) int mPageNo;

@property (nonatomic, strong) NSMutableArray *mData;

@end
