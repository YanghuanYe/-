//
//  ArticleListViewController.m
//  test
//
//  Created by apple on 16/9/26.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "ArticleListViewController.h"
#import "ArticleListModel.h"
#import <MJExtension.h>
#import "Macro.h"
#import <UIImageView+WebCache.h>
#import "ArticleListCell.h"

#define cellID @"ArticleListCell"

@interface ArticleListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)NSArray *articleModelList;
@property (nonatomic, strong)UITableView *articleList;

@end

@implementation ArticleListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"精选文章列表";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回😏" style:UIBarButtonItemStylePlain target:self action:@selector(backToNav)];
    [self addArticleList];
    [self requestForGetPostAnswers];
}
- (void)backToNav
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)requestForGetPostAnswers
{
    NSMutableString *mStr = [[NSMutableString alloc] init];
    [mStr appendString:@"http://api.kanzhihu.com/getpostanswers"];
    [mStr appendFormat:@"/%@/%@", self.timeParam, self.nameStr];
    NSURL *url = [NSURL URLWithString:mStr];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
//            [dic writeToFile:@"/Users/apple/Desktop/github实验文件/看知乎/networkTestJsonFile.plist" atomically:YES];
            ArticleListModel *model = [ArticleListModel mj_objectWithKeyValues:dic];
            self.articleModelList = model.answers;
            NSLog(@"success");
            [self.articleList performSelectorOnMainThread:@selector(reloadData) withObject:self waitUntilDone:YES];
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                [self.articleList reloadData];
//            });
        } else {
            NSLog(@"failure");
        }
    }] resume];
}
- (void)addArticleList
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
    UITableView *articleList = [[UITableView alloc] initWithFrame:CGRectMake(0, blankViewH+64, kSCREENWIDTH, kSCREENHEIGHT-64-blankViewH) style:UITableViewStylePlain];
    self.articleList = articleList;
    [self.view addSubview:articleList];
    [articleList registerClass:[ArticleListCell class] forCellReuseIdentifier:cellID];
    articleList.delegate = self;
    articleList.dataSource = self;
    articleList.estimatedRowHeight = 150;
    articleList.rowHeight = UITableViewAutomaticDimension;
}
#pragma mark - UITableView datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.articleModelList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = self.articleModelList[indexPath.row];
    ArticleListAnswerModel *model = [ArticleListAnswerModel mj_objectWithKeyValues:dic];
    ArticleListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[ArticleListCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    [cell passToData:model];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
