//
//  UIImage+Extension.m

//
//  Created by 👄 on 15/9/14.
//  Copyright (c) 2015年 sczy. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
// 不同系统下自动匹配图片
+(UIImage *)imageWithName:(NSString *)imageName
{
    UIImage *image = nil;
    if ([UIDevice currentDevice].systemVersion.doubleValue >= 7.0) {
        
        image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_os7",imageName]];
    }
    
    if (image == nil) {
        image = [UIImage imageNamed:imageName];
    }
    
    return image;
}


+(UIImage *)resizableImage:(NSString *)imageName
{
    UIImage *image = [UIImage imageWithName:imageName];
    
    
    // 3个方法都可以指定拉伸某个位置
//    [image stretchableImageWithLeftCapWidth:<#(NSInteger)#> topCapHeight:<#(NSInteger)#>];
//    
//    [image resizableImageWithCapInsets:<#(UIEdgeInsets)#>];

    
    CGFloat imageW = image.size.width;
    CGFloat imageH = image.size.height;
    
    return [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageH * 0.5, imageW * 0.5, imageH * 0.5, imageW * 0.5) resizingMode:UIImageResizingModeStretch];
}


@end
