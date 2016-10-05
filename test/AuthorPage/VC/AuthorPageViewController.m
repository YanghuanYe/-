//
//  AuthorPageViewController.m
//  test
//
//  Created by apple on 16/9/28.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "AuthorPageViewController.h"
#import <MJExtension.h>
#import "Macro.h"
#import "AuthorInfoListModel.h"

#define userdetail2_API @"http://api.kanzhihu.com/userdetail2"

@interface AuthorPageViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *authorInfoList;
@property (nonatomic, strong)AuthorInfoListModel *infoListModel;

@end

@implementation AuthorPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    [self addAuthorInfoList];
    [self requestForGetUserDetail];
}
- (void)requestForGetUserDetail
{
    NSString *baseURL = userdetail2_API;
    NSMutableString *mStr = [[NSMutableString alloc] init];
    [mStr appendString:baseURL];
    [mStr appendFormat:@"/%@", self.authorhash];
    NSURL *getDetailURL = [NSURL URLWithString:mStr];
    [[[NSURLSession sharedSession] dataTaskWithURL:getDetailURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//            [dic writeToFile:@"/Users/apple/Desktop/github实验文件/看知乎/networkTestJsonFile.plist" atomically:YES];
            AuthorInfoListModel *model = [AuthorInfoListModel mj_objectWithKeyValues:dic];
            self.infoListModel = model;
            NSLog(@"dd");
            NSLog(@"%d", self.infoListModel.topanswers.count);
            
            AuthorInfoListTopAnswerModel *topAnswerModel = self.infoListModel.topanswers[0];
            NSLog(@"%@", topAnswerModel);
        } else {
            NSLog(@"%@", error.description);
        }
    }] resume];
}
- (void)addAuthorInfoList
{
    UITableView *list = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kSCREENWIDTH, kSCREENHEIGHT) style:UITableViewStyleGrouped];
    self.authorInfoList = list;
    [self.view addSubview:list];
    
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
