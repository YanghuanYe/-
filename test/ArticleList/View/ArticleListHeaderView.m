//
//  ArticleListHeaderView.m
//  test
//
//  Created by apple on 16/9/27.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "ArticleListHeaderView.h"
#import <Masonry.h>

@implementation ArticleListHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubviews:frame];
    }
    return self;
}

- (void)addSubviews:(CGRect)frame
{
    UIImageView *imageV = [[UIImageView alloc] init];
    [self addSubview:imageV];
    imageV.image = [UIImage imageNamed:@"zhihuBackgroundImage"];
    UILabel *label = [[UILabel alloc] init];
    [self addSubview:label];
    label.text = @"不要刷了，到顶了😅";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:14];
    CGFloat labelH = 20;
    CGFloat imageVH = frame.size.height - labelH;
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.centerX.equalTo(self);
        make.top.equalTo(label.mas_bottom);
        make.width.equalTo(@(imageVH));
    }];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(@(labelH));
    }];
}

@end
