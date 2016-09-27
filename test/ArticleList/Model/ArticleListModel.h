//
//  ArticleListModel.h
//  test
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ArticleListModel, ArticleListAnswerModel;

@interface ArticleListModel : NSObject

@property (nonatomic, strong)NSNumber *count;
@property (nonatomic, strong)NSArray<ArticleListAnswerModel *> *answers;

@end

@interface ArticleListAnswerModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *questionid;
@property (nonatomic, copy) NSString *answerid;
@property (nonatomic, copy) NSString *authorname;
@property (nonatomic, copy) NSString *authorhash;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *vote;

@end
