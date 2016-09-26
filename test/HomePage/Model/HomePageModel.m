//
//  HomePageModel.m
//  test
//
//  Created by apple on 16/8/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "HomePageModel.h"

@implementation HomePageModel

- (void)setPosts:(NSArray *)posts
{
    NSMutableArray *tmpArr = [NSMutableArray array];
    for (NSDictionary *dic in posts) {
        HomePageDetailModel *model = [[HomePageDetailModel alloc] init];
        model.count = [dic objectForKey:@"count"];
        model.date = [dic objectForKey:@"date"];
        model.excerpt = [dic objectForKey:@"excerpt"];
        model.id = [dic objectForKey:@"id"];
        model.name = [dic objectForKey:@"name"];
        model.pic = [dic objectForKey:@"pic"];
        model.publishtime = [dic objectForKey:@"publishtime"];
        [tmpArr addObject:model];
    }
    _posts = tmpArr;
}

+ (instancetype)dicToModel:(NSDictionary *)dic
{
    HomePageModel *model = [[HomePageModel alloc] init];
    if ([dic objectForKey:@"count"]) {
        NSNumber *number = [dic objectForKey:@"count"];
        model.count = [number integerValue];
    }
    if ([dic objectForKey:@"posts"]) {
        model.posts = [dic objectForKey:@"posts"];
    }
    return model;
}

@end

@implementation HomePageDetailModel


@end
