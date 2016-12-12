//
//  LocalPathTool.m
//  FTP
//
//  Created by 周鹏 on 2016/12/7.
//  Copyright © 2016年 周鹏. All rights reserved.
//

#import "LocalPathTool.h"

@implementation LocalPathTool
/**
 获取或者创建文件夹
 
 @param filePath 相对路径
 如/chatfiles0/123 代表document根目录下面的chatfiles0下的123
 @return 成功返回绝对路径，失败返回nil
 */
+(NSString *)GetOrCreatFolderPathWithFilePath:(NSString *)filePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths firstObject];
    NSString *createPath = [path stringByAppendingString:filePath];
    //判断createPath路径文件夹是否已存在，此处createPath为需要新建的文件夹的绝对路径
    if ([[NSFileManager defaultManager] fileExistsAtPath:createPath])
    {
        return createPath;
    }
    else
    {
        //创建文件夹
        BOOL success = [[NSFileManager defaultManager] createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
        if (success) {
            return createPath;
        }else
        {
            return nil;
        }
    }
}


/**
 删除文件夹

 @param filePath 相对路径
 如/chatfiles0/123 代表document根目录下面的chatfiles0下的123
 @return 如果有该目录，返回删除成功与否的结果，找不到文件夹返回成功
 */
+(BOOL)deleteFolderPathWithFilePath:(NSString *)filePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths firstObject];
    NSString *createPath = [path stringByAppendingString:filePath];
    if([[NSFileManager defaultManager] fileExistsAtPath:createPath])
    {
        //如果存在临时文件的配置文件
        return [[NSFileManager defaultManager] removeItemAtPath:createPath error:nil];
    }else
    {
        return YES;
    }
}

@end
