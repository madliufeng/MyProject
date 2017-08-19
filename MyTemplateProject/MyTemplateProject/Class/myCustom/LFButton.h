//
//  LFButton.h
//  OneTutor
//
//  Created by Pro on 17/7/6.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LFButtonType) {
    
    LFButtonTypeTopImageBottomTitle = 0,// 上图下文
    LFButtonTypeLeftImageRightTitle ,//左图右文
    
    LFButtonTypeRightImageLeftTitle,//右图左文
    LFButtonTypeBottomImageTopTitle,//下图上文
};

@interface LFButton : UIButton

@property (nonatomic,assign) LFButtonType type;
@property (nonatomic,assign) CGFloat space;

+ (instancetype)buttonWithType:(LFButtonType)type titleImageSpace:(CGFloat)space;
- (instancetype)initWithType:(LFButtonType)type titleImageSpace:(CGFloat)space;

@end
