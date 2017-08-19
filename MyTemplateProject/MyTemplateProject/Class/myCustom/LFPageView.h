//
//  LFPageView.h
//  OneTutor
//
//  Created by Pro on 17/6/8.
//  Copyright © 2017年 liufeng. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^SelectedBlock)(id viewPager, NSInteger index);
//typedef void(^voidBlock)(void);

@interface LFPageView : UIView
{
    NSArray *_titleArray;           /**< 菜单标题 */
    NSArray *_views;                /**< 视图 */
    NSArray *_titleIconsArray;      /**< 菜单标题左侧的小图标 */
    NSArray *_selectedIconsArray;   /**< 菜单被选中时左侧的小图标 */
    NSArray *_tipsCountArray;       /**< 菜单右上角的小红点显示的数量 */

}


@property (nonatomic, strong) UIScrollView *scrollView;
/**
 * 头部标题按钮控件
 */
@property (nonatomic, strong) UIView *pageControl;

/**
 * 选中菜单按钮的下划线
 */
@property (nonatomic, strong) UILabel *selectedLabel;
/**
 * 菜单底部分割线
 */
@property (nonatomic, strong) UILabel *bottomLabel;

@property (nonatomic, copy) voidBlock finishedDraingAction;
@property (nonatomic, copy) SelectedBlock block;

/**
 *  设置viewPager是否允许滚动 默认支持
 */
@property (nonatomic, assign) BOOL   enabledScroll;

/**
 *  当前选择的菜单索引
 */
@property (nonatomic, assign) NSInteger selectIndex;

/**
 *  菜单按钮背景属性
 */
@property (nonatomic, strong) UIColor *tabBgColor;
@property (nonatomic, strong) UIColor *tabSelectedBgColor;

/**
 *  菜单按钮下方横线背景属性
 */
@property (nonatomic, strong) UIColor *tabArrowBgColor;
@property (nonatomic, strong) UIColor *tabSelectedArrowBgColor;

/**
 *  菜单按钮的标题颜色属性
 */
@property (nonatomic, strong) UIColor *tabTitleColor;
@property (nonatomic, strong) UIColor *tabSelectedTitleColor;

/**
 *  是否显示垂直分割线  默认显示
 */
@property (nonatomic, assign) BOOL showVLine;

/**
 *  是否显示底部横线  默认显示
 */
@property (nonatomic, assign) BOOL showBottomLine;

/**
 *  选中状态是否显示底部横线  默认显示
 */
@property (nonatomic, assign) BOOL showSelectedBottomLine;

/**
 *  是否显示垂直分割线  默认显示
 */
@property (nonatomic, assign) BOOL showAnimation;

/**
 * 头部菜单高度
 */
@property (nonatomic, assign) CGFloat pageControlHeight;


- (id)initWithFrame:(CGRect)frame
             titles:(NSArray<NSString *> *)titles
              views:(NSArray<__kindof UIView *> *)views;

- (void)configData;

@end
