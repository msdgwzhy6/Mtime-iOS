//
//  MainTabBarController.m
//  Movie
//
//  Created by 弄潮者 on 15/7/17.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "MainTabBarController.h"
#import "MoviesViewController.h"
#import "NewsViewController.h"
#import "TopViewController.h"
#import "CinemaViewController.h"
#import "MoreViewController.h"
#import "ButtonControl.h"
#import "BaseNavViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)_setViewControllers {
    MoviesViewController *moviesVC = [[MoviesViewController alloc] init];
    NewsViewController *newsVC = [[NewsViewController alloc] init];
    TopViewController *topVC = [[TopViewController alloc] init];
    CinemaViewController *cinemaVC = [[CinemaViewController alloc] init];
    MoreViewController *moreVC = [[MoreViewController alloc] init];
    
    NSArray *vcArray = @[moviesVC,newsVC,topVC,cinemaVC,moreVC];
    NSMutableArray *navArray = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        BaseNavViewController *nav = [[BaseNavViewController alloc] initWithRootViewController:vcArray[i]];
        [navArray addObject:nav];
    }
    
    self.viewControllers = navArray;
}

- (void)_setTabBar {
    Class cls = NSClassFromString(@"UITabBarButton");
    //由于UITabBarButton无法获取，因此通过字符串转化类名获取
    for (UIView *view1 in self.tabBar.subviews) {
        if ([view1 isKindOfClass:cls]) {
            [view1 removeFromSuperview];
        }
//        NSLog(@"%@",view1);    //查看这个view是属于哪个类
    }
    
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all"]];
    

    
    NSArray *title = @[@"电影",@"新闻",@"Top",@"影院",@"更多"];
    NSArray *imageName = @[@"movie_home",@"msg_new",@"start_top250",@"icon_cinema",@"more_select_setting"];
    
    CGFloat width = CGRectGetWidth(self.tabBar.frame)/5;
    CGFloat height = CGRectGetHeight(self.tabBar.frame);

    bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    bgImageView.image = [UIImage imageNamed:@"selectTabbar_bg_all1"];
    [self.tabBar addSubview:bgImageView];
    
//    自己定制button，创建类定制
    for (int i = 0; i < 5; i ++) {
        CGRect frame = CGRectMake(i*width, 0, width, height);
        ButtonControl *button = [[ButtonControl alloc] initWithFrame:frame andImageName:imageName[i] andTitle:title[i]];
        button.tag = i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:button];
    }
//    for (int i = 0; i < 5; i++) {
//        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i*width, 0, width, height)];
//        [button setTitle:title[i] forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [button setImage:[UIImage imageNamed:imageName[i]] forState:UIControlStateNormal];
//        button.titleLabel.font = [UIFont systemFontOfSize:11];
//        button.titleLabel.textAlignment = NSTextAlignmentLeft;
//        
//        //UIButton的图片和文字位置调整
//        button.titleEdgeInsets = UIEdgeInsetsMake(30, -24, 0, 0);
//        button.imageEdgeInsets = UIEdgeInsetsMake(-10, 18, 0, 0);
//        [self.tabBar addSubview:button];
//        
//    }
    
    self.tabBar.translucent = YES;
    
}

- (void)buttonAction:(ButtonControl *)btn {
    NSInteger index = btn.tag;
    self.selectedIndex = index;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    bgImageView.center = btn.center;
    [UIView commitAnimations];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _setViewControllers];
    [self _setTabBar];
    
//    self.tabBar.hidden = YES;
    // Do any additional setup after loading the view.
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
