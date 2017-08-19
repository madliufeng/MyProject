//
//  UIViewController+lf.m
//  
//
//  Created by zhipeng-mac on 16/2/23.
//
//

#import "UIViewController+LF.h"
#import "UIStoryboard+Addition.h"

@implementation UIViewController (LF)

@end

@implementation UIViewController (NavigationItem)

- (void)lf_setRightNavigationItemWithTitle:(NSString *)title actionBlock:(voidBlock)actionBlock {
    
    CGFloat buttonTitleWidth = [title lf_sizeWithFont:FONT(14) constrainedToSize:CGSizeMake(MAXFLOAT, 16)].width;
    UIButton *navRightButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, buttonTitleWidth+10, 30)];
    [navRightButton setTitle:title forState:UIControlStateNormal];
    [navRightButton bk_addEventHandler:^(id sender) {
        
        !actionBlock?:actionBlock();
        
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithCustomView:navRightButton];
    self.navigationItem.rightBarButtonItems = [self rightBarButtonItemsWithOffSetBarButtonItem:rightButtonItem Offset:5];
}


@end

@implementation UIViewController(Create)

+ (id)lf_create
{
    NSString *className = NSStringFromClass([self class]);
    id newObj = [[UIStoryboard fromName:className] instantiateInitialViewController];
    return newObj;
}

+ (id)lf_createFromStoryboardName:(NSString *)sbName WithIdentifier:(NSString *)identifier;
{
    if (sbName && identifier) {
        
        UIStoryboard *storyboard = [UIStoryboard fromName:sbName];
        
        return [storyboard instantiateViewControllerWithIdentifier:identifier];
        
    }
    return nil;
}

+ (id)lf_createFromStoryboardName:(NSString *)sbName {
    
    return  [self lf_createFromStoryboardName:sbName WithIdentifier:[self className]];
}

@end

@implementation UIViewController (BarButtonItemOffset)

-(NSArray *)rightBarButtonItemsWithOffSetBarButtonItem:(UIBarButtonItem *)barButtomItem Offset:(CGFloat)offset {
    
    return @[[self fixedSpaceItemWithOffset:offset], barButtomItem];
    
}

- (NSArray *)leftBarButtonItemsWithOffSetBarButtonItem:(UIBarButtonItem *)barButtomItem Offset:(CGFloat)offset {
    
    return @[[self fixedSpaceItemWithOffset:-offset], barButtomItem];
}

- (UIBarButtonItem *)fixedSpaceItemWithOffset:(CGFloat)offset {
    
    UIBarButtonItem *fixedSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixedSpaceItem.width = -offset;
    
    return fixedSpaceItem;
}

@end
