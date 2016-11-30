//
//  NTNavigationViewController.m

//
//  Created by 👄 on 16/4/14.
//  Copyright (c) 2016年 sczy. All rights reserved.
//

#import "NTNavigationViewController.h"

#import "UIBarButtonItem+Extension.h"

@interface NTNavigationViewController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>



@end

@implementation NTNavigationViewController

// 第一次使用这个类的时候调用
+(void)initialize
{
    [self setupNav];
    [self setupBarBtnItem];
}

-(void)viewDidLoad
{
    
    [super viewDidLoad];
    //这样写了以后就可以通过手势滑动返回上一层了
    __weak NTNavigationViewController *weakSelf = self;
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])  {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }
}

+(void)setupNav
{
    // 背景
    UINavigationBar *navBar = [UINavigationBar appearance];

    
    // title
    NSMutableDictionary *attribute = [NSMutableDictionary dictionary];
    attribute[NSForegroundColorAttributeName] =[UIColor blackColor] ;
    attribute[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    attribute[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    
    
    [navBar setTitleTextAttributes:attribute];
    
}

+(void)setupBarBtnItem
{
    UIBarButtonItem *barBtnItem = [UIBarButtonItem appearance];
    
    NSMutableDictionary *norAttribute = [NSMutableDictionary dictionary];
    norAttribute[NSForegroundColorAttributeName] = [UIColor whiteColor];
    norAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    norAttribute[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    
    [barBtnItem setTitleTextAttributes:norAttribute forState:UIControlStateNormal];
    
    
    NSMutableDictionary *highAttribute = [NSMutableDictionary dictionaryWithDictionary:norAttribute];
    highAttribute[NSForegroundColorAttributeName] = [UIColor redColor];
    [barBtnItem setTitleTextAttributes:highAttribute forState:UIControlStateHighlighted];
    
    
    NSMutableDictionary *disAttribute = [NSMutableDictionary dictionaryWithDictionary:norAttribute];
    disAttribute[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [barBtnItem setTitleTextAttributes:disAttribute forState:UIControlStateDisabled];
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //这个方法是在当前控制器执行push的时候，禁止手势右划返回，避免出现crash的现象，（也可以不实现好像也没什么影响）
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    //判断上一个控制器和现在的控制器是不是同一个，如果是，返回。如果不是push到当前控制器，这就有效避免了同一个控制器连续push的问题
    if ([self.topViewController isMemberOfClass:[viewController class]]) {
        return;
    }else
    {
        if (self.viewControllers.count != 0)
        {
            // 隐藏tabbar
            viewController.hidesBottomBarWhenPushed = YES;
            
            if (([[[ UIDevice currentDevice ] systemVersion ] floatValue ]>= 7.0 ? 20 : 0 ))
            {
                UIBarButtonItem *negativeSpacer = [[ UIBarButtonItem alloc ] initWithBarButtonSystemItem : UIBarButtonSystemItemFixedSpace
                                                   
                                                                                                  target : nil action : nil ];
                
                negativeSpacer. width = - 20 ;//这个数值可以根据情况自由变化
                
                viewController.navigationItem.leftBarButtonItems = @[ negativeSpacer,[UIBarButtonItem barButtonItemWithNorImageName:@"back" highImageName:@"back" target:self action:@selector(back)]];
                
            }
            else
                
                viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithNorImageName:@"back" highImageName:@"back" target:self action:@selector(back)];
        }
        
        

    }
    [super pushViewController:viewController animated:animated];
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate
{
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
}


-(void)back
{
    [self popViewControllerAnimated:YES];
}


-(void)popToRoot
{
    [self popToRootViewControllerAnimated:YES];
}


@end
