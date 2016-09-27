//
//  KZHHttpTool.m
//  test
//
//  Created by apple on 16/9/21.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "KZHHttpTool.h"
#import "NetDefine.h"
#import "KZHHttpParamTool.h"
#import "KZHHttpResult.h"
#import <MJExtension.h>

static NSString * const KZHHttpSuccessCode = @"success";
static NSString * const KZHHttpErrorCode = @"error";

@interface KZHHttpTool ()

@property (nonatomic, strong)AFHTTPSessionManager *manager;

@end

@implementation KZHHttpTool

+ (instancetype)tool {
    static KZHHttpTool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[KZHHttpTool alloc] init];
    });
    return tool;
}

+ (void)getWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSString *))failure
{
    KZHHttpTool *httpTool = [self tool];
    NSString *realURL = [KZHBaseURL stringByAppendingFormat:@"/%@", url];
    [httpTool.manager GET:[realURL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] parameters:[KZHHttpParamTool paramWithParam:params] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        KZHHttpResult *result = [KZHHttpResult mj_objectWithKeyValues:responseObject];
        if ([result.result isEqualToString:KZHHttpSuccessCode] && success) {
            success(responseObject);
        } else {
            if (failure) {
                failure(result.msg);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(@"请求失败！");
        }
    }];
}

+ (void)postWithURL:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSString *))failure
{
    KZHHttpTool *httpTool = [self tool];
    NSString *realURL = [KZHBaseURL stringByAppendingFormat:@"/%@", url];
    [httpTool.manager POST:[realURL stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]] parameters:[KZHHttpParamTool paramWithParam:params] progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error = NULL;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&error];
        KZHHttpResult *result = [KZHHttpResult mj_objectWithKeyValues:dic];
        if (!result) {
            if (DEBUG) {
                NSLog(@"返回非法JSON数据");
            }
            if (failure) {
                failure(@"返回非法JSON数据");
            }
        } else {
            if ([result.result isEqualToString:KZHHttpSuccessCode] && success) {
                success(dic);
            } else {
                if ([result.httpstatus isEqualToString:@"403"]) {
                    //执行退出操作
                }
                if (DEBUG) {
                    NSLog(@"%@", result.msg);
                }
                failure(result.msg);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (DEBUG) {
            NSLog(@"%@", error);
        }
        if (failure) {
            failure(@"请求失败!");
        }
    }];
}

@end
