//
//  UIColor+ZSB.m
//  ZhaoShangBao
//
//  Created by wu bing on 16/5/20.
//  Copyright © 2016年 wu bing. All rights reserved.
//

#import "UIColor+ZSB.h"

@implementation UIColor (ZSB)

+ (UIColor*)colorFromHex:(NSString *)hexString{
    return [UIColor colorFromHex:hexString alpha:1.0];
}


+ (UIColor*)colorFromHex:(NSString *)hexString alpha:(CGFloat)alpha{
    unsigned int hexInt = 0;
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    // Scan hex value
    [scanner scanHexInt:&hexInt];
    
    // Create color object, specifying alpha as well
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexInt & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexInt & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexInt & 0xFF))/255
                    alpha:alpha > 1.0 ? 1.0 : alpha];
    
    return color;
}

@end
