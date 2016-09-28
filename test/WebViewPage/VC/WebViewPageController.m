//
//  WebViewPageController.m
//  test
//
//  Created by apple on 16/9/27.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "WebViewPageController.h"
#import "Macro.h"

@interface WebViewPageController ()

@end

@implementation WebViewPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addWebView];
}

- (void)addWebView
{
    UIWebView *webV = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kSCREENWIDTH, kSCREENHEIGHT)];
    [self.view addSubview:webV];
    webV.scalesPageToFit = YES;
    [webV loadRequest:self.request];
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
