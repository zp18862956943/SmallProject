//
//  DbPath.h
//  JKDBModel
//
//  Created by zhoupeng on 2016/12/2.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
@interface DbPath : NSObject
//路径
@property(copy,nonatomic)NSString *dbPath;

@property(strong,nonatomic)FMDatabaseQueue *dbQueue;

//单例
+ (DbPath *)shareInstance;

/**
 数据库路径
 
 @param directoryName 文件夹目录，不填默认是ZTTMessage
 @param dbName 数据库名字，必填
 @return 路径字符串
 */
- (NSString *)dbPathWithDirectoryName:(NSString *)directoryName
                               dbName:(NSString *)dbName;

@end
