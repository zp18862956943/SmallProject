//
//  LocalPathTool.h
//  FTP
//
//  Created by 周鹏 on 2016/12/7.
//  Copyright © 2016年 周鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LocalPathTool : NSObject

/**
 获取或者创建文件夹
 
 @param filePath 相对路径
 如/chatfiles0/123 代表document根目录下面的chatfiles0下的123
 @return 成功返回绝对路径，失败返回nil
 */
+(NSString *)GetOrCreatFolderPathWithFilePath:(NSString *)filePath;

/**
 删除文件夹
 
 @param filePath 相对路径
 如/chatfiles0/123 代表document根目录下面的chatfiles0下的123
 @return 如果有该目录，返回删除成功与否的结果，找不到文件夹返回成功
 */
+(BOOL)deleteFolderPathWithFilePath:(NSString *)filePath;


@end
