//
//  DbPath.m
//  JKDBModel
//
//  Created by zhoupeng on 2016/12/2.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "DbPath.h"

@implementation DbPath

static DbPath *_instance = nil;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    
    return _instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    return [DbPath shareInstance];
}

- (id)copyWithZone:(struct _NSZone *)zone
{
    return [DbPath shareInstance];
}


/**
 数据库路径

 @param directoryName 文件夹目录，不填默认是ZTTMessage
 @param dbName 数据库名字，必填
 @return 路径字符串
 */
- (NSString *)dbPathWithDirectoryName:(NSString *)directoryName
                               dbName:(NSString *)dbName
{
    NSString *docsdir = [NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSFileManager *filemanage = [NSFileManager defaultManager];
    if (directoryName == nil || directoryName.length == 0) {
        docsdir = [docsdir stringByAppendingPathComponent:@"ZTTMessage"];
    } else {
        docsdir = [docsdir stringByAppendingPathComponent:directoryName];
    }
    BOOL isDir;
    BOOL exit =[filemanage fileExistsAtPath:docsdir isDirectory:&isDir];
    if (!exit || !isDir) {
        [filemanage createDirectoryAtPath:docsdir withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *dbpath = [docsdir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite",dbName]];
    return dbpath;
}

-(NSString *)dbPath
{
    if (_dbPath == nil) {
        _dbPath = [NSString string];
    }
    return _dbPath;
}

-(FMDatabaseQueue *)dbQueue
{
    if (_dbQueue == nil) {
        _dbQueue = [[FMDatabaseQueue alloc]initWithPath:self.dbPath];
    }
    return _dbQueue;
}
@end
