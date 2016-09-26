//
//  TableLoadHeaderView.m
//  test
//
//  Created by apple on 16/8/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "TableLoadHeaderView.h"

@implementation TableLoadHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addLabel:frame];
    }
    return self;
}
- (void)addLabel:(CGRect)frame
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    label.font = [UIFont boldSystemFontOfSize:20.0f];
    NSString *str = @"2016-8-30-20:39";
    NSMutableAttributedString *contentStr = [[NSMutableAttributedString alloc] initWithString:str];
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = [UIImage imageNamed:@"时"];
    attach.bounds = CGRectMake(0, -5, frame.size.height, frame.size.height+5);
    NSAttributedString *contentString = [NSMutableAttributedString attributedStringWithAttachment:attach];
    [contentStr insertAttributedString:contentString atIndex:0];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor lightGrayColor];
    label.font = [UIFont systemFontOfSize:15];
    label.attributedText = contentStr;
    [self addSubview:label];
}

@end
