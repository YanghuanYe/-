//
//  HomePageModel.h
//  test
//
//  Created by apple on 16/8/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomePageModel : NSObject

@property (nonatomic, assign)NSInteger count;
@property (nonatomic, strong)NSArray *posts;

+ (instancetype)dicToModel:(NSDictionary *)dic;

@end

@interface HomePageDetailModel : NSObject

@property (nonatomic, strong)NSString *count;
@property (nonatomic, strong)NSString *date;
@property (nonatomic, strong)NSString *excerpt;
@property (nonatomic, strong)NSString *id;
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *pic;
@property (nonatomic, strong)NSString *publishtime;

@end
