//
//  ArticleListCell.m
//  test
//
//  Created by apple on 16/9/27.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "ArticleListCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "ArticleListModel.h"

#define HomePageBaseAPI @"https://www.zhihu.com/people"
#define QuestionPageBaseAPI @"https://www.zhihu.com/question"
#define AnswerPageBaseAPI @"https://www.zhihu.com/question"

@interface ArticleListCell ()

@property (nonatomic, strong)UIImageView *avatarView;
@property (nonatomic, strong)UILabel *authornameView;
@property (nonatomic, strong)UILabel *titleView;
@property (nonatomic, strong)UILabel *summaryView;
@property (nonatomic, strong)ArticleListAnswerModel *model;

@end

@implementation ArticleListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.avatarView = [[UIImageView alloc] init];
        self.authornameView = [[UILabel alloc] init];
        self.titleView = [[UILabel alloc] init];
        self.summaryView = [[UILabel alloc] init];
        [self.contentView addSubview:self.avatarView];
        [self.contentView addSubview:self.authornameView];
        [self.contentView addSubview:self.titleView];
        [self.contentView addSubview:self.summaryView];
    }
    return self;
}

- (void)passToData:(ArticleListAnswerModel *)model
{
    self.model = model;
//    头像
    NSURL *imageURL = [NSURL URLWithString:model.avatar];
    [self.avatarView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"placeHolder"]];
    UITapGestureRecognizer *avatarViewTap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpToUserHomePage)];
    self.avatarView.userInteractionEnabled = YES;
    [self.avatarView addGestureRecognizer:avatarViewTap];
//    作者
    self.authornameView.text = model.authorname;
    UITapGestureRecognizer *authornameViewTap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpToUserHomePage)];
    [self.authornameView addGestureRecognizer:authornameViewTap];
    self.authornameView.userInteractionEnabled = YES;
//    问题
    self.titleView.text = model.title;
    self.titleView.numberOfLines = 0;
    self.titleView.font = [UIFont systemFontOfSize:16];
    self.titleView.textColor = [UIColor orangeColor];
    UITapGestureRecognizer *titleViewTap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpToQuestionPage)];
    [self.titleView addGestureRecognizer:titleViewTap];
    self.titleView.userInteractionEnabled = YES;
//    答案摘要
    self.summaryView.text = model.summary;
    self.summaryView.numberOfLines = 0;
    self.summaryView.font = [UIFont systemFontOfSize:14];
    self.summaryView.textColor = [UIColor grayColor];
    UITapGestureRecognizer *summaryViewTap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jumpToAnswerPage)];
    [self.summaryView addGestureRecognizer:summaryViewTap];
    self.summaryView.userInteractionEnabled = YES;
    //
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    [self.authornameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.avatarView.mas_centerY);
        make.left.equalTo(self.avatarView.mas_right).offset(5);
        make.right.equalTo(self.contentView.mas_right).offset(5);
        make.height.equalTo(@20);
    }];
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avatarView.mas_bottom).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.summaryView.mas_top).offset(-5);
    }];
    [self.summaryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom).offset(5);
        make.left.equalTo(self.titleView.mas_left).offset(5);
        make.right.equalTo(self.titleView.mas_right).offset(-5);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
}
- (void)jumpToUserHomePage
{
    NSString *homePageURLStr = [HomePageBaseAPI stringByAppendingFormat:@"/%@", self.model.authorhash];
    NSURL *homePageURL = [NSURL URLWithString:homePageURLStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:homePageURL];
    self.webViewPageRequest = request;
    if (self.delegate && [self.delegate respondsToSelector:@selector(jumpToWebViewPageVC:)]) {
        [self.delegate jumpToWebViewPageVC:request];
    }
}
- (void)jumpToQuestionPage
{
    NSString *homePageURLStr = [QuestionPageBaseAPI stringByAppendingFormat:@"/%@", self.model.questionid];
    NSURL *homePageURL = [NSURL URLWithString:homePageURLStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:homePageURL];
    self.webViewPageRequest = request;
    if (self.delegate && [self.delegate respondsToSelector:@selector(jumpToWebViewPageVC:)]) {
        [self.delegate jumpToWebViewPageVC:request];
    }
}
- (void)jumpToAnswerPage
{
    NSString *homePageURLStr = [AnswerPageBaseAPI stringByAppendingFormat:@"/%@/answer/%@", self.model.questionid, self.model.answerid];
    NSURL *homePageURL = [NSURL URLWithString:homePageURLStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:homePageURL];
    self.webViewPageRequest = request;
    if (self.delegate && [self.delegate respondsToSelector:@selector(jumpToWebViewPageVC:)]) {
        [self.delegate jumpToWebViewPageVC:request];
    }
}

@end
