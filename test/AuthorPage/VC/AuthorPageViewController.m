//
//  AuthorPageViewController.m
//  test
//
//  Created by apple on 16/9/28.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "AuthorPageViewController.h"
#import <MJExtension.h>

#define userdetail2_API @"http://api.kanzhihu.com/userdetail2"

@interface AuthorPageViewController ()

@end

@implementation AuthorPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self requestForGetUserDetail];
}
- (void)requestForGetUserDetail
{
//    NSString *baseURL = userdetail2_API;
//    NSMutableString *mStr = [[NSMutableString alloc] init];
//    [mStr appendString:baseURL];
//    [mStr appendFormat:@"/%@", self.authorhash];
    NSString *	mStr = @"http://www.zhihu.com/question/37018823/answer/117589556";
    NSURL *getDetailURL = [NSURL URLWithString:mStr];
    [[[NSURLSession sharedSession] dataTaskWithURL:getDetailURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            [dic writeToFile:@"/Users/apple/Desktop/github实验文件/看知乎/networkTestJsonFile.plist" atomically:YES];
        } else {
            NSLog(@"%@", error.description);
        }
    }] resume];
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
