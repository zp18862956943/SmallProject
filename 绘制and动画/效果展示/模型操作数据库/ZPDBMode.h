//
//  ZPDBMode.h
//  JKDBModel
//
//  Created by zhoupeng on 2016/12/2.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
/** SQLite五种数据类型 */
#define SQLTEXT     @"TEXT"
#define SQLINTEGER  @"INTEGER"
#define SQLREAL     @"REAL"
#define SQLBLOB     @"BLOB"
#define SQLNULL     @"NULL"
#define PrimaryKey  @"primary key"

#define primaryId   @"pk"

@interface ZPDBMode : NSObject
/** 主键 id */
@property (nonatomic, assign)   int        pk;
/** 列名 */
@property (retain, readonly, nonatomic) NSMutableArray         *columeNames;
/** 列类型 */
@property (retain, readonly, nonatomic) NSMutableArray         *columeTypes;
/**
 *  获取该类的所有属性
 */
+ (NSDictionary *)getPropertys;

/** 获取所有属性，包括主键 */
+ (NSDictionary *)getAllProperties;

/** 表中的字段*/
+ (NSArray *)getColumnsWithTableName:(NSString *)tableName;

/** 保存单个数据 */
- (BOOL)saveWithTableName:(NSString *)tableName;
/** 批量保存数据 */
+ (BOOL)saveObjects:(NSArray *)array WithTableName:(NSString *)tableName;

/** 更新单个数据 */
- (BOOL)updateWithTableName:(NSString *)tableName ;

/** 通过条件更新单个数据 */
- (BOOL)updateWithTableName:(NSString *)tableName WhereCriteria:(NSString *)criteria;

/** 批量更新数据*/
+ (BOOL)updateObjects:(NSArray *)array WithTableName:(NSString *)tableName;

/** 删除单个数据 */
- (BOOL)deleteObjectWithTableName:(NSString *)tableName;
/** 批量删除数据 */
+ (BOOL)deleteObjects:(NSArray *)array WithTableName:(NSString *)tableName;
/** 通过条件删除数据 */
+ (BOOL)deleteObjectsByCriteria:(NSString *)criteria WithTableName:(NSString *)tableName;

/** 清空表 */
+ (BOOL)clearTableWithTableName:(NSString *)tableName;

/** 删除表 */
+ (BOOL)dropTableWithTableName:(NSString *)tableName;

/** 查询全部数据 */
+ (NSArray *)findAllWithTableName:(NSString *)tableName;

/** 通过条件查找数据
 * 这样可以进行分页查询 @" WHERE pk > 5 limit 10"
 */
+ (NSArray *)findByCriteria:(NSString *)criteria WithTableName:(NSString *)tableName;

/**
 * 创建表
 * 如果已经创建，返回YES
 */
+ (BOOL)createTableWithTableName:(NSString *)tableName;

@end
