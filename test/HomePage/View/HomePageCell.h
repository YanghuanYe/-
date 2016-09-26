//
//  HomePageCell.h
//  test
//
//  Created by apple on 16/8/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomePageDetailModel;

@interface HomePageCell : UITableViewCell

@property (nonatomic, strong)UIImageView *picView;
@property (nonatomic, strong)UILabel *timeLabel;
@property (nonatomic, strong)UILabel *excerptLabel;
@property (nonatomic, assign)CGFloat rowHeight;

@property (nonatomic, copy)NSString *excerpt;

@property (nonatomic, strong)HomePageDetailModel *detailModel;

@end
