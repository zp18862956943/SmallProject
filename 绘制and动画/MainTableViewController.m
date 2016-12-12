//
//  MainTableViewController.m
//  图形绘制动画
//
//  Created by zhoupeng on 2016/11/9.
//  Copyright © 2016年 ztt. All rights reserved.
//

#import "MainTableViewController.h"

@interface MainTableViewController ()
{
    NSArray *viewControllersArr;
    NSArray *CategoryNameArr;
}
@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"图形绘制动画";
    viewControllersArr = [NSArray arrayWithObjects:@"ViewController0",@"ViewController1",@"ViewController2",@"ViewController3",@"ViewController4",@"ViewController5",@"ViewController6",@"ViewController7",@"ViewController8",@"ViewController9",nil];
    CategoryNameArr = [NSArray arrayWithObjects:@"绘制三角形",@"各种图形效果",@"imageView动画",@"view移动动画",@"plist数据读取",@"直接fmdb",@"封装类FMDB",@"模型操作数据库（推荐）", @"FTP具体操作",@"仿管家先生 瀑布流",nil];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return viewControllersArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = [CategoryNameArr objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *viewC ;
    if (viewC == nil) {
        viewC =  [[NSClassFromString([viewControllersArr objectAtIndex:indexPath.row]) alloc]init];
    }
    viewC.view.backgroundColor = [UIColor whiteColor];
    viewC.title = [CategoryNameArr objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:viewC animated:true];
    
}

@end
