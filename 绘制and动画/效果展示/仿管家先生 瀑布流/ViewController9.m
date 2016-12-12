//
//  ViewController.m
//  CollectionView
//
//  Created by 周鹏 on 2016/10/29.
//  Copyright © 2016年 周鹏. All rights reserved.
//
#define NavHeight 64
#define orangeHeight 60
#define topImgaeHeight 200
#define headImagHeight (topImgaeHeight + orangeHeight)
#define ViewWidth self.view.frame.size.width

#import "ViewController9.h"
#import "MyCollectionViewCell.h"
#import "MyFootView.h"
#import "MyHeadView.h"
#import "UIImage+Color.h"
#import "HeadImageView.h"
#import "Masonry.h"
@interface ViewController9 ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(strong,nonatomic)UICollectionView *myCollectionV;
/** 导航栏标题 */
@property (nonatomic, weak) UILabel *userNameLabel;
@end
@implementation ViewController9
{
    HeadImageView *imageView;
    
    UIButton *orangeView;
    
    NSInteger btnTag;
    
    NSArray *ItemNum;
    
    NSMutableArray *heightArr;
    
    float MaxHeight;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    ItemNum = [NSArray arrayWithObjects:@1,@4,@7,@10,@13,@10,@6,@4,@1,@2,@3,@2,@4,nil];
    heightArr = [NSMutableArray arrayWithCapacity:ItemNum.count];
    
    
    int x = (self.view.frame.size.width - 10) / 100;
    float SumHeight = 0;
    for (int i = 0; i < ItemNum.count; i++) {
        int num = [[ItemNum objectAtIndex:i]intValue];
        float height = ((num - 1) / x + 1) * 140 + 100;
        SumHeight += height;
        [heightArr addObject:[NSNumber numberWithFloat:SumHeight]];
    }
    
    
    MaxHeight = [[heightArr lastObject]floatValue] - self.view.frame.size.height;
    
    btnTag = 1;
    //创建视图
    [self addTheCollectionView];
    [self setUpNavigationBar];
}

-(void)addTheCollectionView{
    //=======================1===========================
    //创建一个块状表格布局对象
    UICollectionViewFlowLayout *flowL = [UICollectionViewFlowLayout new];
    //格子的大小 (长，高)
    flowL.itemSize =CGSizeMake(100,130);
    //横向最小距离
    flowL.minimumInteritemSpacing =1.f;
    //        flowL.minimumLineSpacing=60.f;//代表的是纵向的空间间隔
    //设置，上／左／下／右边距 空间间隔数是多少
    flowL.sectionInset =UIEdgeInsetsMake(10,5,0,5);
    //如果有多个区 就可以拉动
    [flowL setScrollDirection:UICollectionViewScrollDirectionVertical];
    //可以左右拉动
    //        [flowL setScrollDirection:UICollectionViewScrollDirectionHorizontal];
#pragma mark -- 头尾部大小设置
    //设置头部并给定大小
    [flowL setHeaderReferenceSize:CGSizeMake(_myCollectionV.frame.size.width,50)];
    //设置尾部并给定大小
    [flowL setFooterReferenceSize:CGSizeMake(_myCollectionV.frame.size.width,50)];
    //=======================2===========================
    //创建一个UICollectionView
    _myCollectionV = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowL];
    //设置代理为当前控制器
    _myCollectionV.delegate =self;
    _myCollectionV.dataSource =self;
    //设置背景
    _myCollectionV.backgroundColor =[UIColor whiteColor];
#pragma mark -- 注册单元格
    [_myCollectionV registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"MyCollectionViewCell"];
#pragma mark -- 注册头部视图
    [_myCollectionV registerClass:[MyHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MyHeadView"];
#pragma mark -- 注册尾部视图
    [_myCollectionV registerClass:[MyFootView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"MyFootView"];
    _myCollectionV.contentInset = UIEdgeInsetsMake(headImagHeight, 0, 0, 0);
    //添加视图
    [self.view addSubview:_myCollectionV];
    
    [_myCollectionV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(-NavHeight);
        make.bottom.offset(0);
    }];
    
    imageView = [[HeadImageView alloc] initWithFrame:CGRectMake(0, -headImagHeight, self.view.frame.size.width, topImgaeHeight)];
    [_myCollectionV addSubview:imageView];
    
    
    orangeView = [UIButton buttonWithType:UIButtonTypeCustom];
    orangeView.frame = CGRectMake(0, -orangeHeight,ViewWidth, orangeHeight);
    [orangeView addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
    orangeView.backgroundColor = [UIColor yellowColor];
    [_myCollectionV addSubview:orangeView];
    
    
}


#pragma mark - 设置导航栏
- (void)setUpNavigationBar {
    
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    // 清空导航条的阴影的线
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    // 设置导航条标题为透明
    UILabel *usernameLabel = [[UILabel alloc] init];
    usernameLabel.text = @"哈哈";
    // 设置文字的颜色
    usernameLabel.textColor = [UIColor colorWithWhite:1 alpha:0];
    // 根据文字大小自适应尺寸
    [usernameLabel sizeToFit];
    _userNameLabel = usernameLabel;
    [self.navigationItem setTitleView:_userNameLabel];
}


#pragma mark --UICollectionView dataSource

//有多少个Section
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return ItemNum.count;
}

//每个section有多少个元素
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[ItemNum objectAtIndex:section]intValue];
}


//每个单元格的数据
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //初始化每个单元格
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCollectionViewCell" forIndexPath:indexPath];
    //给单元格上的元素赋值
    cell.imageV.image = [UIImage imageNamed:@"img"];
    cell.titleLab.text = [NSString stringWithFormat:@"{%ld-%ld}",indexPath.section,indexPath.row];
    return cell;
}

//设置头尾部内容
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView =nil;
    if (kind ==UICollectionElementKindSectionHeader) {
        //定制头部视图的内容
        MyHeadView *headerV = (MyHeadView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"MyHeadView"forIndexPath:indexPath];
        headerV.titleLab.text =[NSString stringWithFormat:@"头部视图%ld",(long)indexPath.section];
        reusableView = headerV;
    }else if (kind ==UICollectionElementKindSectionFooter){
        MyFootView *footerV = (MyFootView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"MyFootView"forIndexPath:indexPath];
        footerV.titleLab.text =[NSString stringWithFormat:@"尾部视图%ld",(long)indexPath.section];;
        reusableView = footerV;
    }
    return reusableView;
}


//点击单元格
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld=%ld",indexPath.section,indexPath.row);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    //    NSLog(@"==%f",point.y);
    if (point.y < -(NavHeight + headImagHeight)) {
        CGRect rect = imageView.frame;
        rect.origin.y = point.y + NavHeight;
        rect.size.height = -(point.y + NavHeight + 60);
        imageView.frame = rect;
    }else
    {
        if (point.y >= -(NavHeight + orangeHeight * 2)) {
            orangeView.frame = CGRectMake(0, NavHeight, ViewWidth, orangeHeight);
            [self.view addSubview:orangeView];
        }else
        {
            orangeView.frame = CGRectMake(0, -orangeHeight, ViewWidth, orangeHeight);
            [_myCollectionV addSubview:orangeView];
        }
    }
    
    /**处理导航栏逻辑*/
    // 计算透明度
    CGFloat alpha = (point.y + 324.5) / 140.0;
    if (alpha > 1) {
        alpha = 1;
    }
    //    NSLog(@"==%f",alpha);
    
    self.navigationController.navigationBar.subviews.firstObject.alpha = alpha;
    // 设置导航条标题颜色
    _userNameLabel.textColor = [UIColor colorWithWhite:1 alpha:alpha];
    
}

-(void)BtnClick
{
    NSLog(@"_myCollectionV%f =%@",_myCollectionV.contentSize.height,heightArr);
    NSLog(@"%ld",btnTag);
    if (btnTag <= ItemNum.count) {
        if (btnTag == 1) {
            [_myCollectionV setContentOffset:CGPointMake(0, -64 - 60 - 60)];
        }else{
            //加判断，以免出去,理论偏移量是偏移量 - 屏幕高 - 64
            if ([[heightArr objectAtIndex:btnTag - 2]floatValue] - 64 > MaxHeight) {
                [_myCollectionV setContentOffset:CGPointMake(0,MaxHeight - 64)];
            }else
            {
                [_myCollectionV setContentOffset:CGPointMake(0, -64 - 60 - 60 + [[heightArr objectAtIndex:btnTag - 2]floatValue])];
            }
            
        }
        btnTag ++;
    }else{
        btnTag = 1;
        [_myCollectionV setContentOffset:CGPointMake(0, -64 - 60 - 60)];
        
    }
    
    
}
@end
