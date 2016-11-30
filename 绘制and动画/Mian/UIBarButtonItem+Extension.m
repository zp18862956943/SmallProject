//
//  UIBarButtonItem+Extension.m

//
//  Created by 👄 on 15/9/14.
//  Copyright (c) 2015年 sczy. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIImage+Extension.h"

@implementation UIBarButtonItem (Extension)

+(UIBarButtonItem *)barButtonItemWithNorImageName:(NSString *)norImageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc]init];
    
    button.frame = CGRectMake(0, 0, 40, 30);
    
    [button setImage:[UIImage imageWithName:norImageName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageWithName:highImageName] forState:UIControlStateHighlighted];
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc]initWithCustomView:button];
    
}

@end
