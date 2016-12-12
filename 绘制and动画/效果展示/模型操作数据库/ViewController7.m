//
//  ViewController.m
//  数据持久化
//
//  Created by 周鹏 on 2016/11/24.
//  Copyright © 2016年 周鹏. All rights reserved.
//

#import "ViewController7.h"
#import "DbPath.h"
#import "Teachers.h"
@interface ViewController7 ()

@end

@implementation ViewController7

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    //因为DbPath是单例，地址始终没释放掉，所以如果其他地方可以不用再写这句话，除非要换数据库的情况下，必须重新写
    [DbPath shareInstance].dbPath = [[DbPath shareInstance]dbPathWithDirectoryName:nil dbName:@"MyAccount1"];
    
    //    [Teachers createTableWithTableName:@"user0"];
    //
    //    NSMutableArray *Tarr = [NSMutableArray array];
    //    for (int i = 0;i < 100 ;i++) {
    //        Teachers *teacher = [[Teachers alloc]init];
    //        teacher.Name = [NSString stringWithFormat:@"Tome%d",i];
    //        teacher.age = i + 30;
    //        teacher.sex = i % 2 == 0?YES:NO;
    //        teacher.account = [NSString stringWithFormat:@"%d",1491501020 + i];
    //        [Tarr addObject:teacher];
    //    }
    //
    //    [Teachers saveObjects:Tarr WithTableName:@"user0"];
    
    
    
    Teachers *teacher = [[Teachers alloc]init];
    //    [Teachers deleteObjectsByCriteria:@"where age = 30" WithTableName:@"user0"];
    teacher.age = 30;
    teacher.Name = @"TomeAA";
    teacher.account = @"14915010DFF";
    teacher.sex = 1;
    [teacher updateWithTableName:@"user0" WhereCriteria:@"account = '14915010DFF' and Name = 'TomeAA'"];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:NO];
    //        [Teachers dropTableWithTableName:@"user1"];
    
    NSLog(@"==%@",[DbPath shareInstance].dbPath);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

