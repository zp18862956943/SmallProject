//
//  ViewController11.h
//  smallProject
//
//  Created by 周鹏 on 2016/12/12.
//  Copyright © 2016年 ztt. All rights reserved.
//
#import <UIKit/UIKit.h>
typedef void(^NewBlock)(NSString *str1,UIColor *color);

@interface ViewController11 : UIViewController

@property(nonatomic,copy)NewBlock block;

@end
