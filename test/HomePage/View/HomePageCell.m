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
#import "NSString+StringWithUnichar.h"

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
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    self.picView = [[UIImageView alloc] init];
    self.excerptLabel = [[UILabel alloc] init];
    _excerptLabel.font = [UIFont systemFontOfSize:13];
    _excerptLabel.textColor = [UIColor blackColor];
    _excerptLabel.numberOfLines = 0;
    [self.contentView addSubview:_timeLabel];
    [self.contentView addSubview:_picView];
    [self.contentView addSubview:_excerptLabel];
    CGFloat picViewW = kSCREENWIDTH - 10 * 2;
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.centerX.equalTo(self.contentView);
        make.width.equalTo(@(kSCREENWIDTH));
    }];
    [_picView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_timeLabel.mas_bottom).offset(10);
        make.centerX.equalTo(self.contentView);
        make.width.equalTo(@(picViewW));
        make.height.equalTo(@(picViewW));
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
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    NSString *text = [@"        " stringByAppendingString:excerpt];
    self.excerptLabel.text = text;
}
- (void)setDetailModel:(HomePageDetailModel *)detailModel
{
    _detailModel = detailModel;
    NSMutableString *mStr = [[NSMutableString alloc] init];
    int index = 0;
    for (int i = 0; i < detailModel.date.length; i++) {
        unichar *c = [detailModel.date characterAtIndex:i];
        if (c != '-') {
            NSString *tmpStr = [NSString stringWithUnichar:c];
            [mStr appendString:tmpStr];
        } else if (c == '-') {
            switch (index) {
                case 0:
                    [mStr appendString:@"年"];
                    index++;
                    break;
                case 1:
                    [mStr appendString:@"月"];
                    index++;
                    break;
                default:
                    NSLog(@"出错了 %i", index);
                    break;
            }
        }
    }
    NSLog(@"%@", mStr);
//    _timeLabel.text = detailModel.date;
    _timeLabel.text = mStr;
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
