//
//  AuthorInfoListCell.m
//  test
//
//  Created by apple on 16/9/29.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "AuthorInfoListCell.h"

@implementation AuthorInfoListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
/*typedef enum : NSUInteger {
 authorUniversalCell,
 authorDetailCell,
 authorStarCell,
 authorTopAnswerCell,
 authorTrendCell
 } authorCellType;*/
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
    
}
- (void)addAuthorDetailCell {
    
}
- (void)addAuthorStarCell {
    
}
- (void)addAuthorTopAnswerCell {
    
}
- (void)addAuthorTrendCell {
    
}

@end
