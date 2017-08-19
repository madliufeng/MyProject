//
//  UITableView+lf.m
//  YDT
//
//  Created by lf on 15/6/1.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "UITableView+LF.h"
#import "SVProgressHUD.h"

@implementation UITableView (LF)

/**
 *  初始化
 *
 *  @param frame          大小
 *  @param tableViewStyle 表格样式
 *  @param delegate       代理
 *  @param dataSource     数据源
 *
 *  @return 实例
 */
+ (UITableView *)lf_tableViewWithFrame:(CGRect)frame tableViewStyle:(UITableViewStyle)tableViewStyle delegate:(id<UITableViewDelegate>)delegate dataSourec:(id<UITableViewDataSource>)dataSource {
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:tableViewStyle];
    tableView.delegate     = delegate;
    tableView.dataSource   = dataSource;
    
    return tableView;
}

/**
 *  设置分割线为0，iOS8以上还需要实现代理方法 willDisplayCell
 */
- (void)lf_setSeparatorInsetZero {
    // iOS7
    self.separatorInset = UIEdgeInsetsZero;
    
    if (isIOS8) {// iOS8 以上
        // Explictly set your cell's layout margins
        self.layoutMargins = UIEdgeInsetsZero;
    }
}

- (void)lf_registerNibFromCellClassName:(NSString *)cellClassName {
    
    [self registerNib:[UINib nibWithNibName:cellClassName bundle:nil] forCellReuseIdentifier:cellClassName];
}

- (void)lf_registerClassFromCellClassName:(NSString *)cellClassName {
    
    [self registerClass:NSClassFromString(cellClassName) forCellReuseIdentifier:cellClassName];
}

- (id)lf_dequeueReusableCellWithCellClassName:(NSString *)cellClassName {
    
    return [self dequeueReusableCellWithIdentifier:cellClassName];
}

- (id)lf_dequeueReusableCellWithCellClassName:(NSString *)cellClassName forIndexPath:(NSIndexPath *)indexPath {
    
    return [self dequeueReusableCellWithIdentifier:cellClassName forIndexPath:indexPath];
}

@end

@implementation UIScrollView (LF_Refresh)

- (void)setPageNo:(NSUInteger)pageNo {
    
    objc_setAssociatedObject(self, @selector(pageNo), @(pageNo), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSUInteger)pageNo {
    
    NSNumber *pageNo = objc_getAssociatedObject(self, _cmd);
    return pageNo.integerValue;
}

- (void)setPageSize:(NSUInteger)pageSize {
    
    objc_setAssociatedObject(self, @selector(pageSize), @(pageSize), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSUInteger)pageSize {
    
    NSNumber *pageSize = objc_getAssociatedObject(self, _cmd);
    return pageSize.integerValue;
}

- (void)setRefreshHeader:(MJRefreshNormalHeader *)refreshHeader {
    
    objc_setAssociatedObject(self, @selector(refreshHeader), refreshHeader, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MJRefreshNormalHeader *)refreshHeader {
    
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setRefreshDataSource:(NSArray *)refreshDataSource {
    
    objc_setAssociatedObject(self, @selector(refreshDataSource), refreshDataSource, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSArray *)refreshDataSource {
    
    return objc_getAssociatedObject(self, _cmd);
}


- (void)lf_addHeaderHandleEvent:(id<UITableViewRefreshHandlerDelegate>)refreshHandler beginRefreshing:(BOOL)beginRefreshing {
    
    self.pageSize = 10;
    
    self.refreshHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        self.pageNo = 1;

        if (refreshHandler&&[refreshHandler respondsToSelector:@selector(tableViewRefreshDataHandle:)]) {
            
            [refreshHandler tableViewRefreshDataHandle:self];
        }
    }];
    self.refreshHeader.lastUpdatedTimeLabel.hidden = YES;
    
    self.mj_header = self.refreshHeader;
    
    if (beginRefreshing) {
        
        [self.mj_header beginRefreshing];
    }
}

- (void)lf_addFooterHandleEvent:(id<UITableViewRefreshHandlerDelegate>)refreshHandler {
    
    self.pageSize = 10;

    self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        self.pageNo++;
        
        if (refreshHandler&&[refreshHandler respondsToSelector:@selector(tableViewRefreshDataHandle:)]) {
            
            [refreshHandler tableViewRefreshDataHandle:self];
        }
    }];
}

- (void)lf_setRefreshDataSource:(NSArray *)dataSource {
    
//    if (dataSource.count == 0) {
//        
//        [SVProgressHUD showInfoWithStatus:@"暂无数据"];
//    }
    
    if (self.pageNo == 1) {
        
        self.refreshDataSource = dataSource.mutableCopy;
    } else {
        
        NSMutableArray *refreshDataSource = self.refreshDataSource.mutableCopy;
        [refreshDataSource addObjectsFromArray:dataSource];
        
        self.refreshDataSource = refreshDataSource;
    }
    
    SEL selector = @selector(reloadData);
    
    if ([self respondsToSelector:selector]) {
        
        [self performSelector:selector];
    }
    
    [self.refreshHeader endRefreshing];
    [self.mj_footer endRefreshing];
    
}

@end
