//
//  ViewController4.m
//  绘制and动画
//
//  Created by zhoupeng on 2016/11/10.
//  Copyright © 2016年 ztt. All rights reserved.
//
#import "ViewController4.h"
#import "Masonry.h"
@interface ViewController4 ()
{
    //显示
    UILabel *label;
}
//main中的数组
@property(strong,nonatomic)NSArray *mainBundleArr;

@property(copy,nonatomic)NSString *plistPath;
@end

@implementation ViewController4
-(NSArray *)mainBundleArr
{
    if (_mainBundleArr == nil) {
        _mainBundleArr = [NSArray array];
    }
    return _mainBundleArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UISegmentedControl * segmented = [[UISegmentedControl alloc] initWithItems:@[@"mainBundle读", @"document写",@"document读",@"document改"]];
    [segmented addTarget:self action:@selector(segmentedAction:) forControlEvents:UIControlEventValueChanged]; //添加事件
    [self.view addSubview:segmented];
    
    [segmented mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(85);
        make.right.offset(-10);
        make.left.offset(10);
        make.height.equalTo(@60);
    }];

    
    label = [[UILabel alloc]init];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(segmented.mas_bottom).offset(10);
        make.left.right.offset(0);
        make.bottom.offset(0);
    }];
   
    
}

- (void)segmentedAction:(id)sender {
    if ([sender isKindOfClass:[UISegmentedControl class]]) {
        UISegmentedControl *segment = sender;
        if (segment.selectedSegmentIndex == 0) {
            //读
            NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"];
            
            self.mainBundleArr = [NSArray arrayWithContentsOfFile:plistPath];
            
            NSMutableString *mutaStr = [NSMutableString string];
            for (NSDictionary *dic in self.mainBundleArr) {
                NSString *str = [NSString stringWithFormat:@"%@\n%@\n%@\n",[dic objectForKey:@"name"],[dic objectForKey:@"age"],[dic objectForKey:@"height"]];
                [mutaStr appendString:str];
            }
            
            label.text = mutaStr;
        }else if (segment.selectedSegmentIndex == 1){
            //写字典，如果没有就会创建
            NSMutableDictionary *mutaDic = [NSMutableDictionary dictionary];
            [mutaDic setObject:@"name1" forKey:@"key1"];
            [mutaDic setObject:@"name2" forKey:@"key2"];
            [mutaDic setObject:@"name3" forKey:@"key3"];
            BOOL success = [mutaDic writeToFile:self.plistPath atomically:YES];
            if (success) {
                NSLog(@"成功");
            }
        }else if (segment.selectedSegmentIndex == 2){
            //读数组
            NSMutableDictionary *NewDic = [NSMutableDictionary dictionaryWithContentsOfFile:self.plistPath];
            NSLog(@"%@",NewDic);
            NSMutableString *mutaStr = [NSMutableString string];
            for (int i = 0; i < [NewDic allKeys].count; i++) {
                NSString *key = [[NewDic allKeys]objectAtIndex:i];
                NSString *value = [NewDic objectForKey:key];
                NSString *str = [NSString stringWithFormat:@"%@ = %@\n",key,value];
                [mutaStr appendString:str];
            }
            label.text = mutaStr;
        }
        else
        {
            //改
            NSMutableDictionary *Dic = [NSMutableDictionary dictionaryWithContentsOfFile:self.plistPath];
            [Dic setObject:@"newName" forKey:@"key2"];
            [Dic writeToFile:self.plistPath atomically:YES];
        }
        
    }
}

-(NSString *)plistPath
{
    if (_plistPath == nil) {
        NSArray *pathArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [pathArr firstObject];
        _plistPath = [path stringByAppendingPathComponent:@"cars.plist"];
    }
    return _plistPath;
}

@end
