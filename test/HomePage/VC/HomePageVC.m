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
#import "UIViewController+HUD.h"
#import "ArticleListViewController.h"
#import "NSString+StringWithUnichar.h"

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
    [super viewDidLoad];
    self.title = @"首页文章列表";
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_"] style:UIBarButtonItemStylePlain target:self action:@selector(backToNav)];
    [self addTableV];
    [self establishSessionLink];
}
- (void)backToNav
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addTableV
{
    CGFloat blankViewH = 30;
    UIView *blankView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kSCREENWIDTH, blankViewH)];
    [self.view addSubview:blankView];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, kSCREENWIDTH-10, 20)];
    label.text = @"知乎，见识更大的世界😈";
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 5;
    label.alpha = 1;
    label.backgroundColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [blankView addSubview:label];
    blankView.backgroundColor = [UIColor grayColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, blankViewH+64, kSCREENWIDTH, kSCREENHEIGHT-blankViewH-64)];
    [self.view addSubview:self.tableView];
    TableLoadHeaderView *headerView = [[TableLoadHeaderView alloc] initWithFrame:CGRectMake(0, -40, kSCREENWIDTH, 40)];
    [_tableView addSubview:headerView];
    [_tableView registerClass:[HomePageCell class] forCellReuseIdentifier:reuseID];
    _tableView.estimatedRowHeight = 105;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorColor = [UIColor lightGrayColor];
    _tableView.separatorInset = UIEdgeInsetsMake(15, 10, 0, 10);
}

- (void)establishSessionLink
{
    [self showHint:@"正在加载"];
    NSString *urlStr = @"http://api.kanzhihu.com/getposts";
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSDictionary *resDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
//            [resDic writeToFile:@"/Users/apple/Desktop/github实验文件/看知乎/networkTestJsonFile.plist" atomically:YES];
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
    NSString *urlStr = detailModel.pic;
    NSURL *url = [NSURL URLWithString:urlStr];
    [cell.picView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placeHolder"]];
    // 2016-07-30 -> 2016年07月30日
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
    [mStr appendString:@"日精选文章"];
    NSLog(@"%@", mStr);
    cell.timeLabel.text = mStr;
    cell.excerpt = detailModel.excerpt;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomePageDetailModel *detailModel = self.detailModelArr[indexPath.row];
    NSString *date = detailModel.date;
    NSMutableString *mStr = [[NSMutableString alloc] init];
    for (int i = 0; i < date.length; i++) {
        unichar *c = [date characterAtIndex:i];
        if (c != '-') {
            NSString *tmpStr = [NSString stringWithUnichar:c];
            [mStr appendString:tmpStr];
        }
    }
    NSLog(@"%@", mStr);
    ArticleListViewController *vc = [[ArticleListViewController alloc] init];
    vc.timeParam = mStr;
    vc.nameStr = detailModel.name;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
