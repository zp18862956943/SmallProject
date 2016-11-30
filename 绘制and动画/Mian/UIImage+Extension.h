//
//  UIImage+Extension.h

//
//  Created by 👄 on 15/9/14.
//  Copyright (c) 2015年 sczy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
+(UIImage *)imageWithName:(NSString *)imageName;

+(UIImage *)resizableImage:(NSString *)imageName;
@end
