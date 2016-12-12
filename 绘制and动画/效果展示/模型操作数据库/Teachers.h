//
//  Teachers.h
//  数据持久化
//
//  Created by 周鹏 on 2016/12/2.
//  Copyright © 2016年 周鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZPDBMode.h"
@interface Teachers : ZPDBMode
@property(copy,nonatomic)NSString *account;
@property(copy,nonatomic)NSString *Name;
@property(assign,nonatomic)BOOL sex;
@property(assign,nonatomic)int age;
@end
