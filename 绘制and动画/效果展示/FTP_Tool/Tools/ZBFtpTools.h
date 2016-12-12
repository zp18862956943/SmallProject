//
//  ZBFtpTools.h
//  GoldRaccoon
//
//  Created by 肖志斌 on 16/3/29.
//  Copyright © 2016年 肖志斌. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSString+FtpTranscoding.h"
#import "GRRequestsManager.h"


typedef void(^FtpAskListBlock)(NSArray *listArray);
typedef void(^FtpPercentBlock)(CGFloat percent);
typedef void(^FtpDidCompleteUploadBlock)(void);
typedef void(^FtpDidStartRequestBlock)(void);
typedef void(^FtpDidCompleteCreateDirectoryBlock)(void);
typedef void(^FtpDidFailRequestBlock)(NSError *error);
typedef void(^FtpDidCompleteDeleteRequestBlock)(void);
typedef void(^FtpDidCompleteDownloadRequestBlock)(void);
typedef void(^FtpDidFailWritingFileAtPathBlock)(NSString *path,NSError *error);

@interface ZBFtpTools : NSObject <GRRequestsManagerDelegate>

@property (nonatomic, copy) FtpAskListBlock                    ftpAskListBlock;
@property (nonatomic, copy) FtpDidFailRequestBlock             ftpDidFailRequestBlock;
@property (nonatomic, copy) FtpPercentBlock                    ftpPercentBlock;

@property (nonatomic, copy) FtpDidCompleteUploadBlock          FtpDidCompleteUploadBlock;
@property (nonatomic, copy) FtpDidStartRequestBlock            ftpDidStartRequestBlock;
@property (nonatomic, copy) FtpDidCompleteCreateDirectoryBlock ftpDidCompleteCreateDirectoryBlock;
@property (nonatomic, copy) FtpDidCompleteDeleteRequestBlock   ftpDidCompleteDeleteRequestBlock;
@property (nonatomic, copy) FtpDidCompleteDownloadRequestBlock ftpDidCompleteDownloadRequestBlock;
@property (nonatomic, copy) FtpDidFailWritingFileAtPathBlock   ftpDidFailWritingFileAtPathBlock;





/**
 *  1.0的使用,需要每次设置host,user,passworkk
 */
#pragma mark - 封装1.0
/**
 *  请求列表
 *  @param path         路径记得带"/"
 */
+ (void)ZB_ftpAskListWithHost:(NSString *)host userName:(NSString *)user passwork:(NSString *)psw directorAtPath:(NSString *)path backList:(FtpAskListBlock)asklistArray requestError:(FtpDidFailRequestBlock)error;/**< 请求列表 */
/**
 *  上传文件
 *  @param localPath      本地路径
 *  @param remotePath     ftp路径
 */
+ (void)ZB_ftpUploadFileWithHost:(NSString *)host userName:(NSString *)user passwork:(NSString *)psw Path:(NSString *)localPath remotaPath:(NSString *)remotePath  percentBlock:(FtpPercentBlock)percentBlock completeUpload:(FtpDidCompleteUploadBlock)completeUpload requestError:(FtpDidFailRequestBlock)error;
/**
 *  下载文件
 *  @param remotePath       ftp路径
 *  @param toLocalPath      本地路径
 */
+ (void)ZB_ftpDownloadFileWithHost:(NSString *)host userName:(NSString *)user passwork:(NSString *)psw atRemotePath:(NSString *)remotePath toLocalPath:(NSString *)toLocalPath  percentBlock:(FtpPercentBlock)percentBlock completeDownload:(FtpDidCompleteDownloadRequestBlock)completeDownload  requestError:(FtpDidFailRequestBlock)error;

/**
 *  删除文件
 *  @param path           @"/a.jpg"
 */
+ (void)ZB_ftpDeleteFileWithHost:(NSString *)host userName:(NSString *)user passwork:(NSString *)psw atPath:(NSString *)path  completeDelete:(FtpDidCompleteDeleteRequestBlock)completeDelete  requestError:(FtpDidFailRequestBlock)error;
/**
 *  删除文件夹
 *  @param path           @"dir/"
 */
+ (void)ZB_ftpDeleteDirectoryWithHost:(NSString *)host userName:(NSString *)user passwork:(NSString *)psw atPath:(NSString *)path  completeDelete:(FtpDidCompleteDeleteRequestBlock)completeDelete  requestError:(FtpDidFailRequestBlock)error;
/**
 *  创建文件夹;
 *  @param path                    @"dir/"
 */
+ (void)ZB_ftpCreateDirectoryWithHost:(NSString *)host userName:(NSString *)user passwork:(NSString *)psw atPath:(NSString *)path  completeCreateDirectory:(FtpDidCompleteCreateDirectoryBlock)completeCreateDirectory  requestError:(FtpDidFailRequestBlock)error;

/**
 *  2.0的使用,需要初始化一次ZBFtp_setupInitWithHost
 */
#pragma mark - 封装2.0
+ (void)ZBFtp_setupInitWithHost:(NSString *)host user:(NSString *)user psw:(NSString *)psw;/**< 初始化host/user/psw */
+ (void)ZBFtp_AskListWithDirectorAtPath:(NSString *)path backList:(FtpAskListBlock)asklistArray requestError:(FtpDidFailRequestBlock)error;/**< 需要先设置:ZBFtp_setupInitWithHost: */
+ (void)ZBFtp_UploadFileWithLocalPath:(NSString *)localPath remotaPath:(NSString *)remotePath percentBlock:(FtpPercentBlock)percentBlock completeUpload:(FtpDidCompleteUploadBlock)completeUpload   requestError:(FtpDidFailRequestBlock)error;/**< 需要先设置:ZBFtp_setupInitWithHost: */
+ (void)ZBFtp_DownloadFileAtRemotePath:(NSString *)remotePath toLocalPath:(NSString *)toLocalPath  percentBlock:(FtpPercentBlock)percentBlock completeDownload:(FtpDidCompleteDownloadRequestBlock)completeDownload  requestError:(FtpDidFailRequestBlock)error;/**< 需要先设置:ZBFtp_setupInitWithHost: */
+ (void)ZBFtp_DeleteFileAtPath:(NSString *)path  completeDelete:(FtpDidCompleteDeleteRequestBlock)completeDelete  requestError:(FtpDidFailRequestBlock)error;/**< 需要先设置:ZBFtp_setupInitWithHost: */
+ (void)ZBFtp_DeleteDirectoryAtPath:(NSString *)path completeDelete:(FtpDidCompleteDeleteRequestBlock)completeDelete  requestError:(FtpDidFailRequestBlock)error;/**< 需要先设置:ZBFtp_setupInitWithHost: */
+ (void)ZBFtp_CreateDirectoryAtPath:(NSString *)path  completeCreateDirectory:(FtpDidCompleteCreateDirectoryBlock)completeCreateDirectory  requestError:(FtpDidFailRequestBlock)error;/**< 需要先设置:ZBFtp_setupInitWithHost: */

#pragma mark - 其他设置
/**
 *  设置被动模式,默认YES;
 #import "GRRequest.h"里
 设置_passiveMode = YES;
 */

@end
