//
//  AuthorInfoListCell.m
//  test
//
//  Created by apple on 16/9/29.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "AuthorInfoListCell.h"
#import "Macro.h"
#import <Masonry.h>

@interface AuthorInfoListCell ()

@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *signatureLabel;
@property (nonatomic, strong)UIImageView *avatarView;

@end

@implementation AuthorInfoListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier authorCellType:(authorCellType)type
{
    if (self = [self initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        switch (type) {
            case authorUniversalCell:
                [self addAuthorUniversalCell];
                break;
            case authorDetailCell:
                [self addAuthorDetailCell];
                break;
            case authorStarCell:
                [self addAuthorStarCell];
                break;
            case authorTopAnswerCell:
                [self addAuthorTopAnswerCell];
                break;
            case authorTrendCell:
                [self addAuthorTrendCell];
                break;
            default:
                break;
        }
    }
    return self;
}
- (void)addAuthorUniversalCell
{
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.numberOfLines = 0;
    self.nameLabel.textColor = [UIColor blackColor];
    self.signatureLabel = [[UILabel alloc] init];
    self.signatureLabel.numberOfLines = 0;
    self.signatureLabel.textColor = [UIColor lightGrayColor];
    self.avatarView = [UIImageView new];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.signatureLabel];
    [self.contentView addSubview:self.avatarView];
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(10);
        make.width.equalTo(@40);
        make.height.equalTo(@40);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarView.mas_right).offset(20);
        make.right.equalTo(self.contentView).offset(-20);
        make.top.equalTo(self.contentView).offset(20);
    }];
    [self.signatureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.signatureLabel.mas_bottom).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
}
- (void)addAuthorDetailCell {
    
}
- (void)addAuthorStarCell {
    
}
- (void)addAuthorTopAnswerCell {
    
}
- (void)addAuthorTrendCell {
    
}
#pragma mark - getter
@end
