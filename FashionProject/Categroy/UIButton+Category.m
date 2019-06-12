//
//  UIButton+Category.m
//  HLSkate
//
//  Created by 何龙 on 2019/1/31.
//  Copyright © 2019 何龙. All rights reserved.
//

#import "UIButton+Category.h"

@implementation UIButton (Category)
+ (UIButton *)buttonWithImageName:(NSString *)imgName radius:(CGFloat)radius backGroundColor:(UIColor *)color{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    btn.backgroundColor = color;
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = radius;
    return btn;
}
+ (UIButton *)buttonWithImageName:(NSString *)imgName title:(NSString *)text{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UILabel *label = [[UILabel alloc] init];
    label.text = text;
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(0, 35, 50, 12);
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:12];
    [btn addSubview:label];
    
    
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 20, 10);
    btn.imageView.layer.masksToBounds = YES;
    btn.imageView.layer.cornerRadius = 15;
    
    
    return btn;
}
@end
