//
//  NSString+StringWithUnichar.m
//  test
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "NSString+StringWithUnichar.h"

@implementation NSString (StringWithUnichar)

+ (NSString *)stringWithUnichar:(unichar)value
{
    NSString *str = [NSString stringWithFormat:@"%c", value];
    return str;
}

@end
