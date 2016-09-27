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

@interface ArticleListCell ()

@property (nonatomic, strong)UIImageView *avatarView;
@property (nonatomic, strong)UIButton *avatarJumpView;
@property (nonatomic, strong)UILabel *authornameView;
@property (nonatomic, strong)UILabel *titleView;
@property (nonatomic, strong)UILabel *summaryView;

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
        self.avatarJumpView = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.avatarView addSubview:self.avatarJumpView];
//        self.authornameView = [UIButton buttonWithType:UIButtonTypeCustom];
//        self.titleView = [UIButton buttonWithType:UIButtonTypeCustom];
//        self.summaryView = [UIButton buttonWithType:UIButtonTypeCustom];
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
//    头像
    NSURL *imageURL = [NSURL URLWithString:model.avatar];
    [self.avatarView sd_setImageWithURL:imageURL placeholderImage:[UIImage imageNamed:@"placeHolder"]];
//    头像覆盖跳转层
    [self.avatarJumpView addTarget:self action:@selector(jumpToUserHomePage) forControlEvents:UIControlEventTouchUpInside];
//    作者
    self.authornameView.text = model.authorname;
//    问题
    self.titleView.text = model.title;
    self.titleView.numberOfLines = 0;
//    答案摘要
    self.summaryView.text = model.summary;
    self.summaryView.numberOfLines = 0;
    self.summaryView.font = [UIFont systemFontOfSize:14];
    //
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.width.equalTo(@20);
        make.height.equalTo(@20);
    }];
    [self.avatarJumpView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avatarView);
        make.left.equalTo(self.avatarView);
        make.width.equalTo(self.avatarView);
        make.height.equalTo(self.avatarView);
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
        make.height.equalTo(@20);
    }];
    [self.summaryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom).offset(5);
        make.left.equalTo(self.titleView.mas_left).offset(10);
        make.right.equalTo(self.titleView.mas_right).offset(-10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    [self layoutIfNeeded];
    [self layoutSubviews];
}
- (void)jumpToUserHomePage
{
    NSLog(@"%s", __FUNCTION__);
}
- (void)jumpToQuestionPage
{
    NSLog(@"%s", __FUNCTION__);
}
- (void)jumpToAnswerPage
{
    NSLog(@"%s", __FUNCTION__);
}

@end
