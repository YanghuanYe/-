//
//  KZHArticleListManager.m
//  test
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "KZHArticleListManager.h"
#import "KZHHttpTool.h"
#import "ArticleListHttpResult.h"
#import <MJExtension.h>

#define KZHGetPostAnswers_API @"/getpostanswers"

@implementation KZHArticleListManager

+ (void)getPostAnswersWithParam:(NSDictionary *)param completion:(void (^)(NSDictionary *))completion
{
    [KZHHttpTool postWithURL:KZHGetPostAnswers_API params:param success:^(id json) {
        ArticleListHttpResult *result = [ArticleListHttpResult  mj_objectWithKeyValues:json];
        completion(result.answers);
    } failure:^(NSString *error) {
        completion(error);
    }];
}

@end
