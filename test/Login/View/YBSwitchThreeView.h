//
//  YBSwitchThreeView.h
//  test
//
//  Created by apple on 16/9/10.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SwitchBtnEvent) {
    SwitchBtnEventFirst = 89,
    SwitchBtnEventSecond,
    SwitchBtnEventThird,
};

typedef void(^SelectBtnBlock)(SwitchBtnEvent event);

@interface YBSwitchThreeView : UIView

+ (instancetype)switchThreeViewWithTitleArr:(NSArray *)titleArr Block:(SelectBtnBlock)block;

@end
