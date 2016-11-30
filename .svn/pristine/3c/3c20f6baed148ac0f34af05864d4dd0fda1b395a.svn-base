//
//  ViewController6.m
//  绘制and动画
//
//  Created by zhoupeng on 2016/11/30.
//  Copyright © 2016年 ztt. All rights reserved.
//

#import "ViewController6.h"
#import "YZKDBTool.h"
@interface ViewController6 ()
@property(strong,nonatomic)YZKDBTool *tool;
@end

@implementation ViewController6

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tool = [YZKDBTool tool];
    //建立数据库
    FMDatabase *db = [self.tool getDBWithDBName:@"myAccount0.sqlite"];
    //建立表(数据类型)
    [self.tool DataBase:db createTable:@"otherAccount0" keyTypes:@{@"name":@"text",@"age":@"integer",@"account":@"integer"}];
    //给指定的表格添加数据
//    for (int i = 0; i < 40; i++) {
//        [self.tool DataBase:db insertKeyValues:@{@"name":[NSString stringWithFormat:@"Tome%d",i],@"age":[NSNumber numberWithInt:23 + i],@"account":[NSNumber numberWithInt:1491501024 + 3 * i]} intoTable:@"otherAccount0"];
//    }
    
//    //给某个统一改变值
//    [self.tool DataBase:db updateTable:@"otherAccount0" setKeyValues:@{@"name":@"Jake"}];
//    
//    //单条件更新
//    [self.tool DataBase:db updateTable:@"otherAccount0" setKeyValues:@{@"account":[NSNumber numberWithInt:233]} whereCondition:@{@"age":[NSNumber numberWithInt:23]}];
    
    //查询得到数组(有限制个数)
//   NSArray *arr = [self.tool DataBase:db selectKeyTypes:@{@"name":@"text",@"account":@"integer"} fromTable:@"otherAccount0"];
//    NSLog(@"%@",arr);
    
    //条件查询
//    NSArray *arr0 =[self.tool DataBase:db selectKeyTypes:@{@"name":@"text"} fromTable:@"otherAccount0" whereCondition:@{@"name":@"Tome0"}];
//    NSLog(@"%@",arr0);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
