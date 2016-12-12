//
//  NSString+FtpTranscoding.h
//  ZBFTP_GoldRaccoon
//
//  Created by 肖志斌 on 16/4/9.
//  Copyright © 2016年 xzb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FtpTranscoding)
- (NSString *)ftpContainChineseEncoded;/**<ftp包含中文编码*/
- (NSString *)ftpContainChineseDecode;/**<ftp包含中文解码*/

@end
