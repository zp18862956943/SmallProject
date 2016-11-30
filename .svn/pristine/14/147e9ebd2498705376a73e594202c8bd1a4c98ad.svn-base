//
//  ViewController2.m
//  绘制and动画
//
//  Created by zhoupeng on 2016/11/9.
//  Copyright © 2016年 ztt. All rights reserved.
//
#import "Masonry.h"
#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2
{
    CALayer *player;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISegmentedControl * segmented = [[UISegmentedControl alloc] initWithItems:@[@"继续", @"暂停"]];
    segmented.selectedSegmentIndex = 0; //设置默认选中项
    [segmented addTarget:self action:@selector(segmentedAction:) forControlEvents:UIControlEventValueChanged]; //添加事件
    [self.view addSubview:segmented];
    
    [segmented mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(85);
        make.right.offset(-10);
        make.left.offset(10);
        make.height.equalTo(@60);
    }];

    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"frame-1"];
    imageView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
        make.right.offset(-20);
        make.top.equalTo(segmented.mas_bottom).offset(20);
        make.bottom.offset(-40);
    }];
    
    
    NSMutableArray *hopAnimation = [NSMutableArray arrayWithCapacity:20];
    for (int i = 0; i < 20; i++) {
        NSString *name = [NSString stringWithFormat:@"frame-%d",i + 1];
        UIImage *image = [UIImage imageNamed:name];
        [hopAnimation addObject:image];
    }
    
    imageView.animationImages = hopAnimation;
    imageView.animationDuration = 1.0f;
    [imageView startAnimating];
    player = imageView.layer;

}

- (void)segmentedAction:(id)sender {
    if ([sender isKindOfClass:[UISegmentedControl class]]) {
        UISegmentedControl *segment = sender;
        if (segment.selectedSegmentIndex == 0) {
            [self resumeLayer:player];
        }else
        {
            [self pauseLayer:player];
        }
    }
}



-(void)pauseLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

-(void)resumeLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] -    pausedTime;
    layer.beginTime = timeSincePause;
}



@end
