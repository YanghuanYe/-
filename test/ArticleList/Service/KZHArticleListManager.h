//
//  KZHArticleListManager.h
//  test
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KZHArticleListManager : NSObject

+ (void)getPostAnswersWithParam:(NSDictionary *)param completion:(void(^)(NSDictionary *result))completion;

@end
