//
//  AuthorInfoListModel.h
//  test
//
//  Created by apple on 16/9/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AuthorInfoListModel,
AuthorInfoListDetalModel,
AuthorInfoListStarModel,
AuthorInfoListTopAnswerModel,
AuthorInfoListTrendModel,
AuthorInfoListTopAnswerConcreteModel,
AuthorInfoListTrendConcreteModel;

@interface AuthorInfoListModel : NSObject
@property (nonatomic, copy)NSString *avatar;
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *signature;
@property (nonatomic, strong)AuthorInfoListDetalModel *detail;
@property (nonatomic, strong)AuthorInfoListStarModel *star;
@property (nonatomic, strong)NSArray<AuthorInfoListTopAnswerModel *> *topanswers;
@property (nonatomic, strong)NSArray<AuthorInfoListTrendModel *> *trend;
@end
@interface AuthorInfoListDetalModel : NSObject
@property (nonatomic, copy)NSString *agree;
@property (nonatomic, copy)NSString *answer;
@property (nonatomic, copy)NSString *followee;
@property (nonatomic, copy)NSString *follower;
@end
@interface AuthorInfoListStarModel : NSObject
@property (nonatomic, copy)NSString *agreerank;
@property (nonatomic, copy)NSString *answerrank;
@property (nonatomic, copy)NSString *favrank;
@property (nonatomic, copy)NSString *follwerrank;
@property (nonatomic, copy)NSString *ratiorank;
@end

@interface AuthorInfoListTopAnswerModel : NSObject
@property (nonatomic, strong)NSArray<AuthorInfoListTopAnswerConcreteModel *> *topAnswersArr;
@end
@interface AuthorInfoListTopAnswerConcreteModel : NSObject
@property (nonatomic, copy)NSString *agree;
@property (nonatomic, copy)NSString *date;
@property (nonatomic, copy)NSString *link;
@property (nonatomic, copy)NSString *title;
@end

@interface AuthorInfoListTrendModel : NSObject
@property (nonatomic, strong)NSArray<AuthorInfoListTrendConcreteModel *> *trendsArr;
@end
@interface AuthorInfoListTrendConcreteModel : NSObject
@property (nonatomic, strong)NSString *agree;
@property (nonatomic, strong)NSString *answer;
@property (nonatomic, strong)NSString *date;
@property (nonatomic, strong)NSString *follower;
@end
