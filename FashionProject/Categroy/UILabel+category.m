//
//  UILabel+category.m
//  HLSkate
//
//  Created by 何龙 on 2019/1/31.
//  Copyright © 2019 何龙. All rights reserved.
//

#import "UILabel+category.h"

@implementation UILabel (category)
+ (UILabel *)labelWithTitle:(NSString *)title font:(CGFloat)size{
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.font = [UIFont systemFontOfSize:size];
    label.backgroundColor = HLClearColor;
    label.textColor = [UIColor whiteColor];
    return label;
}
+(UILabel *)labelWithText:(NSString *)text
                alignment:(NSTextAlignment)alignment
                textColor:(UIColor *)color
                     font:(CGFloat)font
                superView:(UIView *)superView
{
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.numberOfLines = 0;
    label.textAlignment = alignment;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:font];
    [superView addSubview:label];
    return label;
}
@end
