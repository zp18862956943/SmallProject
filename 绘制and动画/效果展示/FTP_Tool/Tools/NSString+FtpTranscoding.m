//
//  NSString+FtpTranscoding.m
//  ZBFTP_GoldRaccoon
//
//  Created by 肖志斌 on 16/4/9.
//  Copyright © 2016年 xzb. All rights reserved.
//

#import "NSString+FtpTranscoding.h"

@implementation NSString (FtpTranscoding)
- (NSString *)ftpContainChineseEncoded
{
    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL, (__bridge CFStringRef) self, NULL, (CFStringRef)@"!*'\"();:@&=+$,?%#[]% ", kCFStringEncodingGB_18030_2000);
}
- (NSString *)ftpContainChineseDecode
{
    NSString *decodeStr = self;
    if (decodeStr != NULL){
        char *ReadStoreValue = (char *)[decodeStr cStringUsingEncoding:[NSString defaultCStringEncoding]];
        if ( ReadStoreValue != NULL )decodeStr = [NSString stringWithCString:ReadStoreValue encoding:-2147482062];
    }
    return decodeStr;
}
@end
