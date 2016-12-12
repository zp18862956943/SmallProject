//
//  MyHeadView.m
//  CollectionView
//
//  Created by 周鹏 on 2016/10/29.
//  Copyright © 2016年 周鹏. All rights reserved.
//

#import "MyHeadView.h"

@implementation MyHeadView
- (id)initWithFrame:(CGRect)frame

{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        _titleLab = [[UILabel alloc]init];
        
        _titleLab.frame =CGRectMake(0,0, self.frame.size.width,self.frame.size.height);
        
        _titleLab.textAlignment =NSTextAlignmentCenter;
        
        _titleLab.backgroundColor = [UIColor redColor];
        
        [self addSubview:_titleLab];
        
    }
    
    return self;
    
}
@end
