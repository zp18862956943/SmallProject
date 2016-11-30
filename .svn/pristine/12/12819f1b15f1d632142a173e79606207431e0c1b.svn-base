//
//  view0.m
//  图形绘制动画
//
//  Created by zhoupeng on 2016/11/9.
//  Copyright © 2016年 ztt. All rights reserved.
//

#import "view0.h"
#import "Masonry.h"
@implementation view0

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        pointArray = [[NSMutableArray alloc]initWithCapacity:3];
        UILabel *label = [[UILabel alloc]init];
        label.text = @"任意点击屏幕内的三点以确定一个三角形";
        [self addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.offset(0);
            make.height.equalTo(@40);
        }];
        
    }
    return self;
}


-(void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 1.0);
    CGContextSetLineWidth(context, 2.0);
    CGPoint addLines[] = {
        firstPoint,secondPoint,thirdPoint,firstPoint,
    };
    CGContextAddLines(context, addLines, sizeof(addLines)/sizeof(addLines[0]));
    CGContextStrokePath(context);

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    [pointArray addObject:[NSValue valueWithCGPoint:point]];
    if (pointArray.count > 3) {
        [pointArray removeObjectAtIndex:0];
    }
    if (pointArray.count==3) {
        firstPoint = [[pointArray objectAtIndex:0]CGPointValue];
        secondPoint = [[pointArray objectAtIndex:1]CGPointValue];
        thirdPoint = [[pointArray objectAtIndex:2]CGPointValue];
    }
    NSLog(@"%@",[NSString stringWithFormat:@"1:%f/%f\n2:%f/%f\n3:%f/%f",firstPoint.x,firstPoint.y,secondPoint.x,secondPoint.y,thirdPoint.x,thirdPoint.y]);
    [self setNeedsDisplay];
}

@end
