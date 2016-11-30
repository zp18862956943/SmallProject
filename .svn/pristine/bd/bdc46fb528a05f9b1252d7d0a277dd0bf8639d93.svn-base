//
//  ViewController3.m
//  绘制and动画
//
//  Created by zhoupeng on 2016/11/10.
//  Copyright © 2016年 ztt. All rights reserved.
//

#import "ViewController3.h"
#import "Masonry.h"
@interface ViewController3 ()
{
    BOOL clickState;
    int height;
    UIButton *btn;
}
@property(weak,nonatomic)UIView *myView;
@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(-65);
        make.left.right.offset(0);
        make.height.equalTo(@65);
    }];
    
    self.myView = view;
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"下拉" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor lightGrayColor];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_bottom).offset(100);
        make.width.height.equalTo(@40);
        make.centerX.equalTo(view);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)click
{
    clickState = !clickState;
    height = clickState == 0?-65:65;
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        [self.myView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.offset(height);
        }];
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        NSString *str = clickState == 0?@"下拉":@"隐藏";
        [btn setTitle:str forState:UIControlStateNormal];
        
    }];
}

@end
