    //
//  HomePageCell.m
//  test
//
//  Created by apple on 16/8/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "HomePageCell.h"
#import "HomePageModel.h"
#import "Macro.h"
#import "Masonry.h"

@interface HomePageCell()



@end

@implementation HomePageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubviews];
    }
    return self;
}
- (void)addSubviews
{
    self.timeLabel = [[UILabel alloc] init];
    _timeLabel.font = [UIFont systemFontOfSize:14];
    _timeLabel.textColor = [UIColor lightGrayColor];
    self.picView = [[UIImageView alloc] init];
    self.excerptLabel = [[UILabel alloc] init];
    _excerptLabel.font = [UIFont systemFontOfSize:13];
    _excerptLabel.textColor = [UIColor blackColor];
    _excerptLabel.numberOfLines = 0;
    [self.contentView addSubview:_timeLabel];
    [self.contentView addSubview:_picView];
    [self.contentView addSubview:_excerptLabel];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.centerX.equalTo(self.contentView);
        make.width.equalTo(@80);
    }];
    [_picView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_timeLabel.mas_bottom).offset(10);
        make.centerX.equalTo(self.contentView);
        make.width.equalTo(@240);
        make.height.equalTo(@240);
    }];
}

- (void)setExcerpt:(NSString *)excerpt
{
    _excerpt = excerpt;
    CGRect rect = [excerpt boundingRectWithSize:CGSizeMake(kSCREENWIDTH-20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:nil context:nil];
    [_excerptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_picView.mas_bottom).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
//        make.height.equalTo(@(rect.size.height + 10));
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    NSString *text = [@"        " stringByAppendingString:excerpt];
    self.excerptLabel.text = text;
}
- (void)setDetailModel:(HomePageDetailModel *)detailModel
{
    _detailModel = detailModel;
    _timeLabel.text = detailModel.date;
    _excerptLabel.text = detailModel.excerpt;
    CGRect rect = [detailModel.excerpt boundingRectWithSize:CGSizeMake(kSCREENWIDTH-20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil];
    [_excerptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_picView.mas_bottom).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.equalTo(@(rect.size.height));
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
}

@end
