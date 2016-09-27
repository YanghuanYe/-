//
//  ArticleListCell.h
//  test
//
//  Created by apple on 16/9/27.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleListModel.h"

@class ArticleListCell;

@protocol ArticleListCellDelegate <NSObject>

- (void)jumpToWebViewPageVC:(NSURLRequest *)request;

@end

@interface ArticleListCell : UITableViewCell

@property (nonatomic, strong)NSURLRequest *webViewPageRequest;
@property (nonatomic, assign)id <ArticleListCellDelegate> delegate;

- (void)passToData:(ArticleListAnswerModel *)model;

@end
