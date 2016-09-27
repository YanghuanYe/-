//
//  UIViewController+HUD.m
//  TransfarDriver
//
//  Created by Kevin on 15/7/9.
//  Copyright (c) 2015年 Transfar. All rights reserved.
//

#import "UIViewController+HUD.h"

#import <MBProgressHUD.h>
#import <objc/runtime.h>
static const void *HttpRequestHUDKey = &HttpRequestHUDKey;
static const void *RetainCountDKey = &RetainCountDKey;
#define IS_IPHONE_5S [UIScreen mainScreen].bounds.size.height == 568
@implementation UIViewController (HUD)

//单例模式的hud
static MBProgressHUD *mbHub = nil;
- (void)showInstanceHint:(NSString *)hint;
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIView *view = [[UIApplication sharedApplication].delegate window];
        mbHub = [MBProgressHUD showHUDAddedTo:view animated:YES];
        mbHub.userInteractionEnabled = NO;
        // Configure for text only and offset down
        mbHub.mode = MBProgressHUDModeText;
        mbHub.margin = 10.f;
        mbHub.yOffset = IS_IPHONE_5S ? 200.f : 150.f;
    });
    mbHub.labelText = hint;
    mbHub.hidden = NO;
    [self performSelector:@selector(hidInstance) withObject:nil afterDelay:1];
    
}
- (void)hidInstance{
    
    mbHub.hidden = YES;
}

- (void)setRetianCount:(NSUInteger)retianCount {
    objc_setAssociatedObject(self, RetainCountDKey, [NSNumber numberWithUnsignedInteger:retianCount], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSUInteger)retianCount {
    NSNumber *number = objc_getAssociatedObject(self, RetainCountDKey);
    return [number unsignedIntegerValue];
}

- (MBProgressHUD *)HUD{
    return objc_getAssociatedObject(self, HttpRequestHUDKey);
}

- (void)setHUD:(MBProgressHUD *)HUD{
    objc_setAssociatedObject(self, HttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showHudInView:(UIView *)view hint:(NSString *)hint{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.labelText = hint;
    [view addSubview:HUD];
    [HUD show:YES];
    [self setHUD:HUD];
}

- (void)showHudInSubView:(UIView *)view hint:(NSString *)hint{
    if (!self.HUD) {
        self.retianCount = 0;
        MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
        HUD.labelText = hint;
        [view addSubview:HUD];
        [HUD show:YES];
        [self setHUD:HUD];
    }
    
        [self.HUD show:YES];
    
    self.retianCount ++;
}

- (void)showHint:(NSString *)hint {
    
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.yOffset = IS_IPHONE_5S ? 200.f : 150.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1];
}

- (void)showHint:(NSString *)hint yOffset:(float)yOffset {
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.yOffset = IS_IPHONE_5S ? 200.f : 150.f;
    hud.yOffset += yOffset;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1];
}
- (void)showHint:(NSString *)hint  detailsLabelText: (NSString *)details yOffset:(float)yOffset {
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    hud.detailsLabelText=details;
    hud.detailsLabelFont=[UIFont systemFontOfSize:14];
    hud.margin = 10.f;
    hud.yOffset = IS_IPHONE_5S ? 200.f : 150.f;
    hud.yOffset += yOffset;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1];
}


- (void)hideHud{
    [[self HUD] hide:YES];
}

- (void)hideSubHud{
    self.retianCount --;
    if (self.retianCount == 0) {
        [[self HUD] hide:YES];
    }
}

@end
