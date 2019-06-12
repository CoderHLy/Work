//
//  UILabel+category.h
//  HLSkate
//
//  Created by 何龙 on 2019/1/31.
//  Copyright © 2019 何龙. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (category)

+(UILabel *)labelWithTitle:(NSString *)title font:(CGFloat)size;
//添加
+(UILabel *)labelWithText:(NSString *)text
                alignment:(NSTextAlignment)alignment
                textColor:(UIColor *)color
                     font:(CGFloat)font
                superView:(UIView *)superView;
@end

NS_ASSUME_NONNULL_END
