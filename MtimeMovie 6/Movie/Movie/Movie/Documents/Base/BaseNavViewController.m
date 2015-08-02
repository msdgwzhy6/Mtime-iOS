//
//  BaseNavViewController.m
//  Movie
//
//  Created by 弄潮者 on 15/7/17.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "BaseNavViewController.h"

@interface BaseNavViewController ()

@end

@implementation BaseNavViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"XXXXX";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];
//    [[UIApplication sharedApplication] setStatusBarHidden:NO];
//    //修改navigationBar的字体颜色
//    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:
//    [UIFont fontWithName:@"Helvetica-Bold" size:18.0],NSFontAttributeName,
//    [UIColor whiteColor], NSForegroundColorAttributeName,nil];
//    
//    [self.navigationBar setTitleTextAttributes:dic];
    
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];

//    为了显示白色，可以修改barStyle，style为黑时显示白字，为白时显示黑字
    [self.navigationBar setBarStyle:UIBarStyleBlack];   //这是bar，注意跟statusbar区分开来
    // Do any additional setup after loading the view.
}

//这里设置了，下一层次的nav里面同样设置也不会调用

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
    
//    return [self.topViewController preferredStatusBarStyle]; //这里这样设置那么可以再下一层次nav中修改
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
