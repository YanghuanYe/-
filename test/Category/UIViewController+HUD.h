//
//  UIViewController+HUD.h
//  TransfarDriver
//
//  Created by Kevin on 15/7/9.
//  Copyright (c) 2015年 Transfar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HUD)

@property (nonatomic, assign, readonly) NSUInteger retianCount;

- (void)showHudInView:(UIView *)view hint:(NSString *)hint;
- (void)showHudInSubView:(UIView *)view hint:(NSString *)hint;
- (void)hideSubHud;

- (void)hideHud;

- (void)showHint:(NSString *)hint;

// 从默认(showHint:)显示的位置再往上(下)yOffset
- (void)showHint:(NSString *)hint yOffset:(float)yOffset;

- (void)showHint:(NSString *)hint  detailsLabelText: (NSString *)details yOffset:(float)yOffset;
//单例模式的HUD,
- (void)showInstanceHint:(NSString *)hint;


@end
