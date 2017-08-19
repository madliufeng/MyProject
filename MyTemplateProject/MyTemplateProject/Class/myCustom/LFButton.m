//
//  LFButton.m
//  OneTutor
//
//  Created by Pro on 17/7/6.
//
//

#import "LFButton.h"

@implementation LFButton

+ (instancetype)buttonWithType:(LFButtonType)type titleImageSpace:(CGFloat)space {
    return [[self alloc]initWithType:type titleImageSpace:space];
}

- (instancetype)initWithType:(LFButtonType)type titleImageSpace:(CGFloat)space {
    if (self = [super init]) {
        _type = type;
        _space = space;
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        // 如果是xib的话
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    // 1. 得到imageView和titleLabel的宽、高
    
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;

    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    switch (_type) {
        case LFButtonTypeTopImageBottomTitle:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-_space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-_space/2.0, 0);
        }
            break;
        case LFButtonTypeLeftImageRightTitle:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -_space/2.0, 0, _space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, _space/2.0, 0, -_space/2.0);
        }
            break;

        case LFButtonTypeRightImageLeftTitle:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+_space/2.0, 0, -labelWidth-_space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-_space/2.0, 0, imageWith+_space/2.0);
        }
            break;

        case LFButtonTypeBottomImageTopTitle:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-_space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-_space/2.0, -imageWith, 0, 0);
        }
            break;

        default:
            break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;

}


@end
