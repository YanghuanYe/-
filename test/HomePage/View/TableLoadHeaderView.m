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
    label.textColor = [UIColor lightGrayColor];
//        label.font = [UIFont systemFontOfSize:14];
    NSString *dateStr = [self strToDate];
    NSMutableString *mStr = [[NSMutableString alloc] init];
    [mStr appendString:dateStr];
    [mStr appendString:@"\n珍惜时光，珍惜岁月"];
    NSMutableAttributedString *contentStr = [[NSMutableAttributedString alloc] initWithString:mStr];
    [contentStr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor blackColor]} range:NSMakeRange(25, 9)];
    [contentStr addAttributes:@{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle], NSFontAttributeName:[UIFont systemFontOfSize:14], NSForegroundColorAttributeName:[UIColor lightGrayColor]} range:NSMakeRange(0, 25)];
    label.textAlignment = NSTextAlignmentCenter;
    label.attributedText = contentStr;
    label.numberOfLines = 0;
    [self addSubview:label];
}

- (NSString *)strToDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"现在是yyyy年MM月dd日，HH点mm分ss秒"];
    NSDate *date = [NSDate date];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

@end
