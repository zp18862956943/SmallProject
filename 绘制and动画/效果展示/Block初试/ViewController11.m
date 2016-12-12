//
//  ViewController11.m
//  smallProject
//
//  Created by 周鹏 on 2016/12/12.
//  Copyright © 2016年 ztt. All rights reserved.
//

#import "ViewController11.h"

@interface ViewController11 ()

@end

@implementation ViewController11

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.block(@"这是第二个页面的值0",[UIColor redColor]);
//    self.block(@"这是第二个页面的值1",[UIColor grayColor]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
