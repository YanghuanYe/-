//
//  AuthorInfoListCell.h
//  test
//
//  Created by apple on 16/9/29.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    authorUniversalCell,
    authorDetailCell,
    authorStarCell,
    authorTopAnswerCell,
    authorTrendCell
} authorCellType;

@interface AuthorInfoListCell : UITableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier authorCellType:(authorCellType)type;

@end
