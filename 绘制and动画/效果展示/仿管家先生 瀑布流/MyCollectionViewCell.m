//
//  MyCollectionViewCell.m
//  CollectionView
//
//  Created by 周鹏 on 2016/10/29.
//  Copyright © 2016年 周鹏. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame

{
    
    self = [super initWithFrame:frame];
    
    if (self)
        
    {
        
        //定义CELL单元格内容
        
        _imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, 100,100)];
        
        _imageV.backgroundColor = [UIColor clearColor];
        
        [self addSubview:_imageV];
        
        
        
        _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0,100, 100, 30)];
        
        _titleLab.backgroundColor = [UIColor clearColor];
        
        _titleLab.textAlignment =NSTextAlignmentCenter;
        
        [self addSubview:_titleLab];    
        
    }
    
    return self;
    
}
@end
