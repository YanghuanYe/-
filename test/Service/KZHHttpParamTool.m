//
//  KZHHttpParamTool.m
//  test
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "KZHHttpParamTool.h"
#import "NSDictionary+ForNSNull.h"

@implementation KZHHttpParamTool

+ (NSDictionary *)paramWithParam:(NSDictionary *)param
{
    NSMutableDictionary *realParams = [NSMutableDictionary dictionaryWithDictionary:param];
    [realParams setSafeObject:[[NSUserDefaults standardUserDefaults] objectForKey:@"token"] forKey:@"token"];
    return realParams;
}

@end
