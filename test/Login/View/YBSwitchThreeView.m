//
//  YBSwitchThreeView.m
//  test
//
//  Created by apple on 16/9/10.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import "YBSwitchThreeView.h"
#import "Masonry.h"
#import "UIColor+ZSB.h"

#define kSCREENSIZE [UIScreen mainScreen].bounds.size
#define kSCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define kSCREENHEIGHT [UIScreen mainScreen].bounds.size.height

#define kBtnWidth 40.0

@interface YBSwitchThreeView ()

@property (nonatomic, strong)UIButton *btn0;
@property (nonatomic, strong)UIButton *btn1;
@property (nonatomic, strong)UIButton *btn2;
@property (nonatomic, strong)UIButton *selectedBtn;
@property (nonatomic, copy)SelectBtnBlock block;

@end

@implementation YBSwitchThreeView

+ (instancetype)switchThreeViewWithTitleArr:(NSArray *)titleArr Block:(SelectBtnBlock)block
{
    return [[self alloc] initWithTitleArr:titleArr Block:block];
}

- (instancetype)initWithTitleArr:(NSArray *)titleArr Block:(SelectBtnBlock)block
{
    if (self = [super init]) {
        self.block = block;
        _btn0 = [self btnNewWithName:titleArr[0] WithTag:SwitchBtnEventFirst];
        _btn1 = [self btnNewWithName:titleArr[1] WithTag:SwitchBtnEventSecond];
        _btn2 = [self btnNewWithName:titleArr[2] WithTag:SwitchBtnEventThird];
        CGFloat spaceW = (kSCREENWIDTH - 3 * kBtnWidth) / 4;
        self.backgroundColor = [UIColor orangeColor];
        for (int i = 0; i < 3; i++) {
            NSInteger tag = 89 + i;
            CGFloat width = kBtnWidth;
            [[self viewWithTag:tag] mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(self);
                make.width.equalTo(@(width));
                make.left.equalTo(self.mas_left).offset((spaceW + i * (spaceW + width)));
                make.top.equalTo(self);
            }];
        }
        [self.btn0 sendActionsForControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (UIButton *)btnNewWithName:(NSString *)name WithTag:(SwitchBtnEvent)tag
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor colorFromHex:@"#2f2f2f"] forState:UIControlStateNormal];
    [btn setTitle:name forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorFromHex:@"ff6a0f"] forState:UIControlStateSelected];
    btn.tag = tag;
    [btn addTarget:self action:@selector(switchBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    return btn;
}
- (void)switchBtnClick:(UIButton *)sender
{
    if (self.selectedBtn.tag == sender.tag) return;
    if (sender.tag == SwitchBtnEventFirst) {
        [self cancelSelect:sender.tag];
        if (self.block) self.block(SwitchBtnEventFirst);
    } else if (sender.tag == SwitchBtnEventSecond) {
        [self cancelSelect:sender.tag];
        if (self.block) self.block(SwitchBtnEventSecond);
    } else if(sender.tag == SwitchBtnEventThird) {
        [self cancelSelect:sender.tag];
        if (self.block) self.block(SwitchBtnEventThird);
    }
}
- (void)cancelSelect:(NSInteger)tag
{
    self.selectedBtn.selected = NO;
    ((UIButton *)[self viewWithTag:tag]).selected = YES;
    self.selectedBtn = [self viewWithTag:tag];
}

@end
