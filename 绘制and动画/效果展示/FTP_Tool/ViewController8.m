//
//  ViewController8.m
//  smallProject
//
//  Created by 周鹏 on 2016/12/12.
//  Copyright © 2016年 ztt. All rights reserved.
//
/*FTP地址，帐号，密码*/
#define FTP_Address @"10.18.23.122"
#define FTP_UserName @"zttmsg"
#define FTP_PassWord @"ChinazttMsg2012"

#import "ViewController8.h"
#import "ZBFtpTools.h"
#import "LocalPathTool.h"
@interface ViewController8 ()

@end


@implementation ViewController8

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self askListBtnClick:nil];
}
- (void)startFtpInit
{
    [ZBFtpTools ZBFtp_setupInitWithHost:FTP_Address
                                   user:FTP_UserName
                                    psw:FTP_PassWord];
}

//查看文件目录
- (void)askListBtnClick:(id)sender
{
    [self startFtpInit];
    [ZBFtpTools ZBFtp_AskListWithDirectorAtPath:@"/chatfiles"
                                       backList:^(NSArray *listArray)
     {
         for (NSString *fileName in listArray)
         {
             NSLog(@"%@",fileName);
         }
         NSLog(@"查看目录请求完成");
     }
                                   requestError:^(NSError *error)
     {
         if (error)NSLog(@"error:%@",error);
     }];
}


//上传文件
- (void)uploadFileBtnClick:(id)sender
{
    [self startFtpInit];
    //本地文件路径
    NSString *localPathStr = [[NSBundle mainBundle] pathForResource:@"img1" ofType:@"png"];
    //远程存放路径
    NSString *remotaPathStr = @"/chatfiles/china1.png";
    
    [ZBFtpTools ZBFtp_UploadFileWithLocalPath:localPathStr
                                   remotaPath:remotaPathStr
                                 percentBlock:^(CGFloat percent)
     {
         NSLog(@"%@",[NSString stringWithFormat:@"%.2f%%",percent *100]);
     }
                               completeUpload:^
     {
         NSLog(@"文件上传完成");
     }
                                 requestError:^(NSError *error)
     {
         if (error)NSLog(@"error:%@",error);
     }];
}

//下载文件
- (void)downloadBtnClick:(id)sender
{
    [self startFtpInit];
    NSString *localPathStr = [LocalPathTool GetOrCreatFolderPathWithFilePath:@"/zhoupeng/"];
    //新的文件名，不可以跟在上面的方法，否则会创建出对应的文件夹，而不是文件
    [localPathStr stringByAppendingString:@"newPic.jpg"];
    
    NSLog(@"--localPathStr-->%@<-----",localPathStr);
    NSString *remotaPathStr = @"faces/image-615418241.jpg";
    
    [ZBFtpTools ZBFtp_DownloadFileAtRemotePath:remotaPathStr
                                   toLocalPath:localPathStr
                                  percentBlock:^(CGFloat percent)
     {
         NSLog(@"%@",[NSString stringWithFormat:@"%.2f%%",percent *100]);
     }
                              completeDownload:^
     {
         NSLog(@"文件下载完成");
         
     }
                                  requestError:^(NSError *error)
     {
         if (error)NSLog(@"error:%@",error);
     }];
}

//删除远程文件
- (void)deleteFileBtnClick:(id)sender
{
    [self startFtpInit];
    NSString *deleteFilePathStr = @"/chatfiles/file.txt";
    [ZBFtpTools ZBFtp_DeleteFileAtPath:deleteFilePathStr
                        completeDelete:^
     {
         NSLog(@"文件删除完成");
     }
                          requestError:^(NSError *error)
     {
         if (error)NSLog(@"error:%@",error);
     }];
}

//创建文件夹
- (void)createDirBtnClick:(id)sender
{
    [self startFtpInit];
    NSString *directoryPathStr = @"/chatfiles/china/";
    [ZBFtpTools ZBFtp_CreateDirectoryAtPath:directoryPathStr
                    completeCreateDirectory:^
     {
         NSLog(@"文件夹创建完成");
     }
                               requestError:^(NSError *error)
     {
         if (error)NSLog(@"error:%@",error);
     }];
}


//删除文件夹（服务器不允许,无权限）
- (void)deleteDirBtnClick:(id)sender
{
    [self startFtpInit];
    NSString *deleteDirPathStr = @"/chatfiles/china/";
    [ZBFtpTools ZBFtp_DeleteFileAtPath:deleteDirPathStr
                        completeDelete:^
     {
         NSLog(@"删除文件夹成功");
     }
                          requestError:^(NSError *error)
     {
         if (error)NSLog(@"error:%@",error);
     }];
}

@end
