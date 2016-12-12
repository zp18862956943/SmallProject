//
//  ViewController10.m
//  smallProject
//
//  Created by 周鹏 on 2016/12/12.
//  Copyright © 2016年 ztt. All rights reserved.
//

#import "ViewController10.h"
#import "ViewController11.h"
#import "Masonry.h"
typedef void(^MyBlock)(NSString *s1,UIColor *c);

@interface ViewController10 ()

@property(nonatomic,strong)UIButton *smallView;
@end

@implementation ViewController10

-(void)func:(MyBlock)BlockPra
{
    BlockPra(@"str",[UIColor blueColor]);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self smallView];
    
//    [self func:^(NSString *s1, UIColor *c) {
//        NSLog(@"%@",s1);
//        self.smallView.backgroundColor = c;
//    }];
    
    NSLog(@"我在玩手机");
    NSLog(@"手机没电了");
    
//    [self performSelector:@selector(chargeMyIphone:) withObject:Nil afterDelay:10];
    [self chargeMyIphone:^{
        NSLog(@"出去逛街");
    }];
    NSLog(@"我在看电视");
    
}


-(void)chargeMyIphone:(void(^)(void))finishBlock
{
    NSLog(@"充电拉");
    double delayInSeconds = 10.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        NSLog(@"电充好了");
        finishBlock();
    });
}

-(UIButton *)smallView
{
    if (!_smallView) {
        _smallView = [[UIButton alloc]init];
        [_smallView addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_smallView];
        
        [_smallView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(100);
            make.right.offset(-100);
            make.top.offset(200);
            make.bottom.offset(-100);
        }];
    }
    return _smallView;
}

-(void)btnClick
{
    ViewController11 *view11 = [[ViewController11 alloc]init];
//    __weak  ViewController10 *weakSelf = self;
    __weak __typeof(self) weakSelf = self;
    view11.block = ^(NSString *s1,UIColor *c){
        NSLog(@"%@",s1);
        weakSelf.view.backgroundColor = c;
    };
    [self.navigationController pushViewController:view11 animated:true];
}
@end
