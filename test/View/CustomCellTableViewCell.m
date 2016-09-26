
//
//  CustomCellTableViewCell.m
//  test
//
//  Created by apple on 16/8/14.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "CustomCellTableViewCell.h"
#import "Masonry.h"

@implementation CustomCellTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.frame = CGRectMake(0, 0, 999, 999);
    self.contentView.frame = CGRectMake(0, 0, 999, 999);
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"title";
    self.titleLabel.numberOfLines = 0;
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.width.equalTo(@(30));
        make.height.equalTo(@(30));
    }];
    self.descLabel = [[UILabel alloc] init];
    self.descLabel.numberOfLines = 0;
    self.descLabel.text = @"描述形容的句子描述形容的句子描述形容的句子描述形容的句子描述形容的句子描述形容的句子描述形容的句子描述形容的句子描述形容的句子描述形容的句子描述形容的句子描述形容的句子描述形容的句子描述形容的句子";
    [self.contentView addSubview:self.descLabel];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.left.equalTo(self.titleLabel);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.bottom.offset(-10);
//        make.height.equalTo(@(60));
    }];
    return self;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
