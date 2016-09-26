//
//  HomePageVC.m
//  test
//
//  Created by apple on 16/8/30.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "HomePageVC.h"
#import "Macro.h"
#import "TableLoadHeaderView.h"
#import "HomePageModel.h"
#import "HomePageCell.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"

#define reuseID @"HomePageCellID"

@interface HomePageVC()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)HomePageModel *homePageModel;
@property (nonatomic, strong)NSArray *detailModelArr;
//@property (nonatomic, assign)CGFloat rowHeight;

@end

@implementation HomePageVC

- (void)viewDidLoad
{
    [self addTableV];
    [self establishSessionLink];
}

- (void)addTableV
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kSCREENWIDTH, kSCREENHEIGHT)];
    [self.view addSubview:self.tableView];
    TableLoadHeaderView *headerView = [[TableLoadHeaderView alloc] initWithFrame:CGRectMake(0, -20, kSCREENWIDTH, 20)];
    [_tableView addSubview:headerView];
    [_tableView registerClass:[HomePageCell class] forCellReuseIdentifier:reuseID];
    _tableView.estimatedRowHeight = 105;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorColor = [UIColor clearColor];
    _tableView.separatorInset = UIEdgeInsetsMake(15, 10, 0, 10);
}

- (void)establishSessionLink
{
    NSString *urlStr = @"http://api.kanzhihu.com/getposts";
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSDictionary *resDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            NSLog(@"dic = %@", resDic);
            NSLog(@"response = %@", response);
//            [resDic writeToFile:@"/Users/apple/Desktop/gfgfg.plist" atomically:YES];
            HomePageModel *model = [HomePageModel dicToModel:resDic];
            self.detailModelArr = model.posts;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
            NSLog(@"请求成功");
        } else {
            NSLog(@"请求失败 ---%@", error.userInfo);
        }
    }] resume];
}

// tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.detailModelArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomePageDetailModel *detailModel = self.detailModelArr[indexPath.row];
    HomePageCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (!cell) {
        cell = [[HomePageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
//    cell.detailModel = detailModel;
    NSString *urlStr = detailModel.pic;
    NSURL *url = [NSURL URLWithString:urlStr];
    [cell.picView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeHolder"]];
    cell.timeLabel.text = detailModel.date;
    cell.excerpt = detailModel.excerpt;
//    cell.excerptLabel.text = detailModel.excerpt;
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 105;
//}



@end
