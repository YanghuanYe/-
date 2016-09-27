//
//  LoginViewController.m
//  test
//
//  Created by apple on 16/8/25.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "LoginViewController.h"
#import "Macro.h"
#import "HomePageVC.h"
#import "YBSwitchThreeView.h"

@interface LoginViewController ()

@property (nonatomic, strong)UITextField *usrTF;
@property (nonatomic, strong)UITextField *pwdTF;
@property (nonatomic, strong)UIButton *loginBtn;
@property (nonatomic, strong)YBSwitchThreeView *threeV;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"登录页";
    self.view.backgroundColor = [UIColor whiteColor];

    [self layoutPage];
}

- (void)layoutPage
{
    YBSwitchThreeView *threeV = [YBSwitchThreeView switchThreeViewWithTitleArr:@[@"xia", @"dsa", @"dsada"] Block:^(SwitchBtnEvent event) {
        switch (event) {
            case SwitchBtnEventFirst:
                NSLog(@"1");
                break;
            case SwitchBtnEventSecond:
                NSLog(@"2");
                break;
            case SwitchBtnEventThird:
                NSLog(@"3");
                break;
            default:
                NSLog(@"0000");
                break;
        }
    }];
    self.threeV = threeV;
    threeV.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:threeV];
    [self.view addSubview:self.usrTF];
    [self.view addSubview:self.pwdTF];
    [self.view addSubview:self.loginBtn];
    NSDictionary *viewDic = [[NSDictionary alloc] initWithObjectsAndKeys:self.usrTF,@"v1", self.pwdTF,@"v2", self.loginBtn,@"v3",self.threeV,@"v4", nil];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-80-[v1]-80-|" options:0 metrics:nil views:viewDic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-80-[v2]-80-|" options:0 metrics:nil views:viewDic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-120-[v3]-120-|" options:0 metrics:nil views:viewDic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[v4]|" options:0 metrics:nil views:viewDic]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[v1(30)]-20-[v2(v1)]-30-[v3(30)]-40-[v4(44)]" options:0 metrics:nil views:viewDic]];
}

- (void)accessToNewPage
{
    HomePageVC *vc = [[HomePageVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (NSArray *)dicTransformToArr:(NSDictionary *)dic
{
    NSArray *keys = [dic allKeys];
    NSMutableArray *tmpArr = [NSMutableArray array];
    for (int i = 0; i < dic.allKeys.count; i++) {
        NSString *key = keys[i];
        NSDictionary *newDic = [NSDictionary dictionaryWithObjectsAndKeys:key, [dic objectForKey:key], nil];
        [tmpArr addObject:newDic];
    }
    return tmpArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

#pragma mark - layout

#pragma mark - getter
- (UITextField *)usrTF
{
    if (!_usrTF) {
        _usrTF = [[UITextField alloc] init];
        _usrTF.placeholder = @"用户名";
        _usrTF.textAlignment = NSTextAlignmentCenter;
        _usrTF.font = [UIFont systemFontOfSize:14];
        _usrTF.translatesAutoresizingMaskIntoConstraints = NO;
        _usrTF.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _usrTF;
}
- (UITextField *)pwdTF
{
    if (!_pwdTF) {
        _pwdTF = [[UITextField alloc] init];
        _pwdTF.placeholder = @"输入密码";
        _pwdTF.textAlignment = NSTextAlignmentCenter;
        _pwdTF.font = [UIFont systemFontOfSize:14];
        _pwdTF.translatesAutoresizingMaskIntoConstraints = NO;
        _pwdTF.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _pwdTF;
}
- (UIButton *)loginBtn
{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.translatesAutoresizingMaskIntoConstraints = NO;
        [_loginBtn addTarget:self action:@selector(accessToNewPage) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

@end
