
//
//  HeadImageView.m
//  CollectionView
//
//  Created by 周鹏 on 2016/11/3.
//  Copyright © 2016年 周鹏. All rights reserved.
//

#import "HeadImageView.h"
#import "Masonry.h"
@implementation HeadImageView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:@"img"];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        [imageView setClipsToBounds:YES];
        [self addSubview:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.offset(0);
        }];
        
         
        UIView *black = [[UIView alloc]initWithFrame:CGRectMake(20, imageView.frame.size.height - 30, 20, 20)];
         black.backgroundColor = [UIColor redColor];
         [imageView addSubview:black];
        
        [black mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(-10);
            make.left.offset(20);
            make.height.width.equalTo(@20);
        }];
        
    }
    return self;
}

@end
