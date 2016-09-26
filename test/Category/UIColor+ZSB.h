//
//  UIColor+ZSB.h
//  ZhaoShangBao
//
//  Created by wu bing on 16/5/20.
//  Copyright © 2016年 wu bing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ZSB)

+ (UIColor*)colorFromHex:(NSString *)hexString;

+ (UIColor*)colorFromHex:(NSString *)hexString alpha:(CGFloat)alpha;
@end
