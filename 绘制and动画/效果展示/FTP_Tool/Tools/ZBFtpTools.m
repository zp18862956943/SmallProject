//
//  ZBFtpTools.m
//  GoldRaccoon
//
//  Created by 肖志斌 on 16/3/29.
//  Copyright © 2016年 肖志斌. All rights reserved.
//

#import "ZBFtpTools.h"

static ZBFtpTools *singleFtp = nil;

@implementation ZBFtpTools
static GRRequestsManager *requestsManager;
+ (id)shareSingle
{
    @synchronized(self)
    {
        if (!singleFtp)singleFtp = [[super allocWithZone:NULL] init];
    }
    return singleFtp;
}
#pragma mark - 封装1.0
+ (void)setupWithHost:(NSString *)host userName:(NSString *)user passwork:(NSString *)psw
{
    requestsManager = [[GRRequestsManager alloc] initWithHostname:host user:user password:psw];
    requestsManager.delegate = [ZBFtpTools shareSingle];
}
#pragma mark list
+ (void)ZB_ftpAskListWithHost:(NSString *)host userName:(NSString *)user passwork:(NSString *)psw directorAtPath:(NSString *)path backList:(FtpAskListBlock)asklistArray requestError:(FtpDidFailRequestBlock)error
{
    
    [self setupWithHost:host userName:user passwork:psw];
    [requestsManager addRequestForListDirectoryAtPath:path];
    [requestsManager startProcessingRequests];
    
    ZBFtpTools *ftpTool  = [ZBFtpTools shareSingle];
    ftpTool.ftpAskListBlock = ^(NSArray *listArray){
        if (asklistArray)asklistArray(listArray);
    };
    ftpTool.ftpDidFailRequestBlock = ^(NSError *blackError){
        if (error)error(blackError);
    };
}
#pragma mark upload
+ (void)ZB_ftpUploadFileWithHost:(NSString *)host userName:(NSString *)user passwork:(NSString *)psw Path:(NSString *)localPath remotaPath:(NSString *)remotePath percentBlock:(FtpPercentBlock)percentBlock completeUpload:(FtpDidCompleteUploadBlock)completeUpload   requestError:(FtpDidFailRequestBlock)error
{
    [self setupWithHost:host userName:user passwork:psw];
    [requestsManager addRequestForUploadFileAtLocalPath:localPath toRemotePath:remotePath];
    [requestsManager startProcessingRequests];
    
    ZBFtpTools *ftpTool  = [ZBFtpTools shareSingle];
    ftpTool.ftpPercentBlock = ^(CGFloat percent){
        if (percentBlock)percentBlock(percent);
    };
    ftpTool.FtpDidCompleteUploadBlock = ^(){
        if (completeUpload)completeUpload();
    };
    ftpTool.ftpDidFailRequestBlock = ^(NSError *blackError){
        if (error)error(blackError);
    };
    
}
#pragma mark DownloadFile
+ (void)ZB_ftpDownloadFileWithHost:(NSString *)host userName:(NSString *)user passwork:(NSString *)psw atRemotePath:(NSString *)remotePath toLocalPath:(NSString *)toLocalPath  percentBlock:(FtpPercentBlock)percentBlock completeDownload:(FtpDidCompleteDownloadRequestBlock)completeDownload  requestError:(FtpDidFailRequestBlock)error
{
    [self setupWithHost:host userName:user passwork:psw];
    [requestsManager addRequestForDownloadFileAtRemotePath:remotePath toLocalPath:toLocalPath];
    [requestsManager startProcessingRequests];
    
    ZBFtpTools *ftpTool  = [ZBFtpTools shareSingle];
    ftpTool.ftpPercentBlock = ^(CGFloat percent){
        if (percentBlock)percentBlock(percent);
    };
    ftpTool.ftpDidCompleteDownloadRequestBlock = ^(){
        if (completeDownload)completeDownload();
    };
    ftpTool.ftpDidFailRequestBlock = ^(NSError *blackError){
        if (error)error(blackError);
    };
}

#pragma mark deleteFile
+ (void)ZB_ftpDeleteFileWithHost:(NSString *)host userName:(NSString *)user passwork:(NSString *)psw atPath:(NSString *)path  completeDelete:(FtpDidCompleteDeleteRequestBlock)completeDelete  requestError:(FtpDidFailRequestBlock)error
{
    [self setupWithHost:host userName:user passwork:psw];
    [requestsManager addRequestForDeleteFileAtPath:path];
    [requestsManager startProcessingRequests];
    
    ZBFtpTools *ftpTool  = [ZBFtpTools shareSingle];
    ftpTool.ftpDidCompleteDeleteRequestBlock = ^(){
        if (completeDelete)completeDelete();
    };
    ftpTool.ftpDidFailRequestBlock = ^(NSError *blackError){
        if (error)error(blackError);
    };
}
#pragma mark deleteDirectory
+ (void)ZB_ftpDeleteDirectoryWithHost:(NSString *)host userName:(NSString *)user passwork:(NSString *)psw atPath:(NSString *)path completeDelete:(FtpDidCompleteDeleteRequestBlock)completeDelete  requestError:(FtpDidFailRequestBlock)error
{
    [self setupWithHost:host userName:user passwork:psw];
    [requestsManager addRequestForDeleteDirectoryAtPath:path];
    [requestsManager startProcessingRequests];
    ZBFtpTools *ftpTool  = [ZBFtpTools shareSingle];
    ftpTool.ftpDidCompleteDeleteRequestBlock = ^(){
        if (completeDelete)completeDelete();
    };
    ftpTool.ftpDidFailRequestBlock = ^(NSError *blackError){
        if (error)error(blackError);
    };
}
#pragma mark CreateDirectory
+ (void)ZB_ftpCreateDirectoryWithHost:(NSString *)host userName:(NSString *)user passwork:(NSString *)psw atPath:(NSString *)path  completeCreateDirectory:(FtpDidCompleteCreateDirectoryBlock)completeCreateDirectory  requestError:(FtpDidFailRequestBlock)error
{
    [self setupWithHost:host userName:user passwork:psw];
    
    [requestsManager addRequestForCreateDirectoryAtPath:path];
    [requestsManager startProcessingRequests];
    
    ZBFtpTools *ftpTool  = [ZBFtpTools shareSingle];
    ftpTool.ftpDidCompleteCreateDirectoryBlock = ^(){
        if (completeCreateDirectory)completeCreateDirectory();
    };
    ftpTool.ftpDidFailRequestBlock = ^(NSError *blackError){
        if (error)error(blackError);
    };
}
#pragma mark - 封装2.0
+ (void)ZBFtp_setupInitWithHost:(NSString *)host user:(NSString *)user psw:(NSString *)psw
{
    [self setupWithHost:host userName:user passwork:psw];
}
#pragma mark list
+ (void)ZBFtp_AskListWithDirectorAtPath:(NSString *)path backList:(FtpAskListBlock)asklistArray requestError:(FtpDidFailRequestBlock)error
{
    [requestsManager addRequestForListDirectoryAtPath:path];
    [requestsManager startProcessingRequests];
    
    ZBFtpTools *ftpTool  = [ZBFtpTools shareSingle];
    ftpTool.ftpAskListBlock = ^(NSArray *listArray){
        if (asklistArray)asklistArray(listArray);
    };
    ftpTool.ftpDidFailRequestBlock = ^(NSError *blackError){
        if (error)error(blackError);
    };
}
#pragma mark upload
+ (void)ZBFtp_UploadFileWithLocalPath:(NSString *)localPath remotaPath:(NSString *)remotePath percentBlock:(FtpPercentBlock)percentBlock completeUpload:(FtpDidCompleteUploadBlock)completeUpload   requestError:(FtpDidFailRequestBlock)error
{
    [requestsManager addRequestForUploadFileAtLocalPath:localPath toRemotePath:remotePath];
    [requestsManager startProcessingRequests];
    
    ZBFtpTools *ftpTool  = [ZBFtpTools shareSingle];
    ftpTool.ftpPercentBlock = ^(CGFloat percent){
        if (percentBlock)percentBlock(percent);
    };
    ftpTool.FtpDidCompleteUploadBlock = ^(){
        if (completeUpload)completeUpload();
    };
    ftpTool.ftpDidFailRequestBlock = ^(NSError *blackError){
        if (error)error(blackError);
    };
    
}
#pragma mark DownloadFile
+ (void)ZBFtp_DownloadFileAtRemotePath:(NSString *)remotePath toLocalPath:(NSString *)toLocalPath  percentBlock:(FtpPercentBlock)percentBlock completeDownload:(FtpDidCompleteDownloadRequestBlock)completeDownload  requestError:(FtpDidFailRequestBlock)error
{
    [requestsManager addRequestForDownloadFileAtRemotePath:remotePath toLocalPath:toLocalPath];
    [requestsManager startProcessingRequests];
    
    ZBFtpTools *ftpTool  = [ZBFtpTools shareSingle];
    ftpTool.ftpPercentBlock = ^(CGFloat percent){
        if (percentBlock)percentBlock(percent);
    };
    ftpTool.ftpDidCompleteDownloadRequestBlock = ^(){
        if (completeDownload)completeDownload();
    };
    ftpTool.ftpDidFailRequestBlock = ^(NSError *blackError){
        if (error)error(blackError);
    };
}

#pragma mark deleteFile
+ (void)ZBFtp_DeleteFileAtPath:(NSString *)path  completeDelete:(FtpDidCompleteDeleteRequestBlock)completeDelete  requestError:(FtpDidFailRequestBlock)error
{
    [requestsManager addRequestForDeleteFileAtPath:path];
    [requestsManager startProcessingRequests];
    
    ZBFtpTools *ftpTool  = [ZBFtpTools shareSingle];
    ftpTool.ftpDidCompleteDeleteRequestBlock = ^(){
        if (completeDelete)completeDelete();
    };
    ftpTool.ftpDidFailRequestBlock = ^(NSError *blackError){
        if (error)error(blackError);
    };
}
#pragma mark deleteDirectory
+ (void)ZBFtp_DeleteDirectoryAtPath:(NSString *)path completeDelete:(FtpDidCompleteDeleteRequestBlock)completeDelete  requestError:(FtpDidFailRequestBlock)error
{
    [requestsManager addRequestForDeleteDirectoryAtPath:path];
    [requestsManager startProcessingRequests];
    ZBFtpTools *ftpTool  = [ZBFtpTools shareSingle];
    ftpTool.ftpDidCompleteDeleteRequestBlock = ^(){
        if (completeDelete)completeDelete();
    };
    ftpTool.ftpDidFailRequestBlock = ^(NSError *blackError){
        if (error)error(blackError);
    };
}
#pragma mark CreateDirectory
+ (void)ZBFtp_CreateDirectoryAtPath:(NSString *)path  completeCreateDirectory:(FtpDidCompleteCreateDirectoryBlock)completeCreateDirectory  requestError:(FtpDidFailRequestBlock)error
{
    [requestsManager addRequestForCreateDirectoryAtPath:path];
    [requestsManager startProcessingRequests];
    
    ZBFtpTools *ftpTool  = [ZBFtpTools shareSingle];
    ftpTool.ftpDidCompleteCreateDirectoryBlock = ^(){
        if (completeCreateDirectory)completeCreateDirectory();
    };
    ftpTool.ftpDidFailRequestBlock = ^(NSError *blackError){
        if (error)error(blackError);
    };
}

#pragma mark - GRRequestsManagerDelegate
- (void)requestsManager:(id<GRRequestsManagerProtocol>)requestsManager didStartRequest:(id<GRRequestProtocol>)request
{if (_ftpDidStartRequestBlock)_ftpDidStartRequestBlock();
}
- (void)requestsManager:(id<GRRequestsManagerProtocol>)requestsManager didCompleteListingRequest:(id<GRRequestProtocol>)request listing:(NSArray *)listing
{
    
    NSMutableArray *decodeListings = [NSMutableArray arrayWithCapacity:[listing count]];
    for (NSString *tmpStr in listing)
    {
        [decodeListings addObject:[tmpStr ftpContainChineseDecode]];
    }
    if (_ftpAskListBlock)_ftpAskListBlock(decodeListings);
}
- (void)requestsManager:(id<GRRequestsManagerProtocol>)requestsManager didCompleteCreateDirectoryRequest:(id<GRRequestProtocol>)request
{
    if(_ftpDidCompleteCreateDirectoryBlock)_ftpDidCompleteCreateDirectoryBlock();
}
- (void)requestsManager:(id<GRRequestsManagerProtocol>)requestsManager didCompleteDeleteRequest:(id<GRRequestProtocol>)request
{
    if (_ftpDidCompleteDeleteRequestBlock)_ftpDidCompleteDeleteRequestBlock();
}
- (void)requestsManager:(id<GRRequestsManagerProtocol>)requestsManager didCompletePercent:(float)percent forRequest:(id<GRRequestProtocol>)request
{
    if (_ftpPercentBlock)_ftpPercentBlock(percent);
}
- (void)requestsManager:(id<GRRequestsManagerProtocol>)requestsManager didCompleteUploadRequest:(id<GRDataExchangeRequestProtocol>)request
{
    if (_FtpDidCompleteUploadBlock)_FtpDidCompleteUploadBlock();
}
- (void)requestsManager:(id<GRRequestsManagerProtocol>)requestsManager didCompleteDownloadRequest:(id<GRDataExchangeRequestProtocol>)request
{
    if (_ftpDidCompleteDownloadRequestBlock)_ftpDidCompleteDownloadRequestBlock();
}
- (void)requestsManager:(id<GRRequestsManagerProtocol>)requestsManager didFailWritingFileAtPath:(NSString *)path forRequest:(id<GRDataExchangeRequestProtocol>)request error:(NSError *)error
{
    if (_ftpDidFailWritingFileAtPathBlock) _ftpDidFailWritingFileAtPathBlock(path,error);
}
- (void)requestsManager:(id<GRRequestsManagerProtocol>)requestsManager didFailRequest:(id<GRRequestProtocol>)request withError:(NSError *)error
{
    if (_ftpDidFailRequestBlock) _ftpDidFailRequestBlock(error);
}
@end
