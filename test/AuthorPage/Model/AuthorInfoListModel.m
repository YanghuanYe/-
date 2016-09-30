//
//  AuthorInfoListModel.m
//  test
//
//  Created by apple on 16/9/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "AuthorInfoListModel.h"
@implementation AuthorInfoListModel

+ (NSDictionary *)objectClassInArray
{
    return @{@"topanswers":@"topanswers",
             @"trend":@"trend"};
}

@end
@implementation AuthorInfoListDetalModel
@end
@implementation AuthorInfoListStarModel
@end
@implementation AuthorInfoListTopAnswerModel
+ (NSDictionary *)objectClassInArray
{
    return @{@"topAnswersArr":@"topAnswersArr"};
}
@end
@implementation AuthorInfoListTrendModel
@end
@implementation AuthorInfoListTopAnswerConcreteModel
+ (NSDictionary *)objectClassInArray
{
    return @{@"trendsArr":@"trendsArr"};
}
@end
@implementation AuthorInfoListTrendConcreteModel
@end
