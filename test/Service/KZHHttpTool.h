//
//  KZHHttpTool.h
//  test
//
//  Created by apple on 16/9/21.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface KZHHttpTool : NSObject

//Get
// url params success failure
+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(id json))success failure:(void(^)(NSString *error))failure;

//Post
// url params success failure
+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(id json))success failure:(void(^)(NSString *error))failure;

@end
