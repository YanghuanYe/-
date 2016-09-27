//
//  ArticleListCell.h
//  test
//
//  Created by apple on 16/9/27.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleListModel.h"

@interface ArticleListCell : UITableViewCell

- (void)passToData:(ArticleListAnswerModel *)model;

@end
