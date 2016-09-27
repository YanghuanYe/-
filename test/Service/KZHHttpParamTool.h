//
//  KZHHttpParamTool.h
//  test
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <Foundation/Foundation.h>

// 工具类： 用来为业务请求的参数配置通用的http参数，如token， 后期可能拓展加密方案等

@interface KZHHttpParamTool : NSObject

// 根据传进来的业务参数， 配置http接口所需参数
+ (NSDictionary *)paramWithParam:(NSDictionary *)param;

@end
