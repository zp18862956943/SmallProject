//
//  ViewController5.m
//  绘制and动画
//
//  Created by zhoupeng on 2016/11/30.
//  Copyright © 2016年 ztt. All rights reserved.
//

#import "ViewController5.h"
#import "FMDB.h"

@interface ViewController5 ()
@property(nonatomic,strong)FMDatabaseQueue *queue;

@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //使用数据库队列操作数据，fmdb线程是不安全的，建议使用FMDatabaseQueue
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"data.sqlite"];
    NSLog(@"%@",path);
    //里面已经创建了FMDdataBase实例，数据库实例
    self.queue = [FMDatabaseQueue databaseQueueWithPath:path];
    
    
    //删
    //    [self delete];
    
    //建表
    [self creatTableWithTableName:@"user"];
    
    [self insertIntoTableName:@"user"];
    [self query];
    [self deleteOne];
}

//建表
-(void)creatTableWithTableName:(NSString *)tableName
{
    //通过block，拿到FMDatabase *db
    [self.queue inDatabase:^(FMDatabase *db) {
        //创表
        NSString *str = [NSString stringWithFormat:@"create table if not exists %@(id integer primary key autoincrement,name text,age integer,sex text);",tableName];
        BOOL result = [db executeUpdate:str];
        if (result) {
            NSLog(@"创表成功");
        }
    }];
    
}
//插入
- (void)insertIntoTableName:(NSString *)tableName
{    //通过block，拿到FMDatabase *db
    [self.queue inDatabase:^(FMDatabase *db) {
        for (int i = 0; i<40; i++) {
            NSString *name = [NSString stringWithFormat:@"rose-%d", arc4random() % 1000];
            NSNumber *age = @(arc4random() % 100 + 1);
            NSString *sex = [NSString stringWithFormat:@"female-%d", arc4random() % 1000];
            
            [db executeUpdate:[NSString stringWithFormat:@"insert into %@ (name, age,sex) values (?, ?, ?);",tableName], name, age,sex];
            
        }
    }];
}

//更新数据
- (void)update
{
    [self.queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:@"update t_student set age = ? where name = ?;", @20, @"jack"];
        [db executeUpdate:@"update t_student set age = ? where name = ?;", @20, @"jack"];
    }];
}

//删表
- (void)delete
{
    [self.queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:[NSString stringWithFormat:@"DELETE FROM %@",@"t_student"]];
    }];
}

//删除表中的某个记录
-(void)deleteOne
{
    [self.queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:[NSString stringWithFormat:@"DELETE FROM %@ WHERE id = %d",@"t_student",290]];
    }];
}
//查询
- (void)query
{
    [self.queue inDatabase:^(FMDatabase *db) {
        // 1.查询数据
        FMResultSet *rs = [db executeQuery:@"select * from t_student WHERE age > ?;", @50];
        NSLog(@"%@",rs);
        // 2.遍历结果集
        while (rs.next) {
            int ID = [rs intForColumn:@"id"];
            NSString *name = [rs stringForColumn:@"name"];
            int age = [rs intForColumn:@"age"];
            
            NSLog(@"%d %@ %d", ID, name, age);
        }
    }];
}

@end
