//
//  ViewController1.m
//  图形绘制动画
//
//  Created by zhoupeng on 2016/11/9.
//  Copyright © 2016年 ztt. All rights reserved.
//

#import "ViewController1.h"
#import "KView.h"
#import "Masonry.h"
@interface ViewController1 ()

@end

@implementation ViewController1
{
    KView *kview;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UISegmentedControl * segmented = [[UISegmentedControl alloc] initWithItems:@[@"1", @"2", @"3",@"4",@"5"]];
    segmented.selectedSegmentIndex = 0; //设置默认选中项
    [segmented addTarget:self action:@selector(segmentedAction:) forControlEvents:UIControlEventValueChanged]; //添加事件
    [self.view addSubview:segmented];

    [segmented mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(85);
        make.right.offset(-10);
        make.left.offset(10);
        make.height.equalTo(@60);
    }];
    
    kview = [[KView alloc]init];
    kview.selectIndex = 0;
    [self.view addSubview:kview];
    [kview mas_makeConstraints:^(MASConstraintMaker *make) {
        __weak __typeof(self) weakSelf = self;
        make.top.equalTo(segmented.mas_bottom).offset(20);
        make.width.height.equalTo(@200);
        make.centerX.equalTo(weakSelf.view);
    }];
}



- (void)segmentedAction:(id)sender {
    if ([sender isKindOfClass:[UISegmentedControl class]]) {
        UISegmentedControl *segment = sender;
        kview.selectIndex = segment.selectedSegmentIndex;
    }
}
@end
