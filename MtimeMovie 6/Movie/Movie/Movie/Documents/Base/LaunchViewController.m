//
//  LaunchViewController.m
//  Movie
//
//  Created by 弄潮者 on 15/7/27.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "LaunchViewController.h"
#import "Header.h"
#import "UIViewExt.h"
#import "MainTabBarController.h"

@interface LaunchViewController ()
{
    NSMutableArray *imageViewArray;
    NSInteger index;
}
@end

@implementation LaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [imageView setImage:[UIImage imageNamed:@"iconfont-dianying-4.png"]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
    
    [self _creatImageView];
    
    [self _startAnimation];
    // Do any additional setup after loading the view.
}

- (void)_creatImageView {
    NSInteger count = 24;
    CGFloat imageWidth = kwidth/4;
    CGFloat imageHeight = kheight/6;
    
    CGFloat x = 0;
    CGFloat y = 0;
    imageViewArray = [NSMutableArray array];
    for (NSInteger i = 0; i < count; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageWidth, imageHeight)];
        imageView.alpha = 0;
        NSString *imageName = [NSString stringWithFormat:@"%li",i+1];
        [imageView setImage:[UIImage imageNamed:imageName]];
        [self.view addSubview:imageView];
        
        [imageViewArray addObject:imageView];
        
        if (i <= 3) {
            x = i*imageWidth;
            y = 0;
        }else if (i <= 8) {
            x = kwidth-imageWidth;
            y = (i-3)*imageHeight;
        }else if (i <= 11) {
            x = kwidth - (i-7)*imageWidth;
            y = kheight - imageHeight;
        }else if (i <= 15) {
            x = 0;
            y = kheight - (i-10)*imageHeight;
        }else if (i <= 17) {
            x = (i - 15)*imageWidth;
            y = imageHeight;
        }else if (i <= 20) {
            x = 2*imageWidth;
            y = (i - 16)*imageHeight;
        }else if (i <= 21) {
            x = imageWidth;
            y = 4*imageHeight;
        }else if (i <= 23) {
            x = imageWidth;
            y = kheight - (i - 19)*imageHeight;
        }
        imageView.origin = CGPointMake(x, y);
    }
}

- (void)_startAnimation {
    if (index >= imageViewArray.count) {
        UIWindow *window = self.view.window;
        MainTabBarController *main = [[MainTabBarController alloc] init];
        main.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
        [UIView animateWithDuration:0.1 animations:^{
            main.view.transform = CGAffineTransformIdentity;
        }];
        window.rootViewController = main;
        return;
    }
    UIImageView *imageView = imageViewArray[index];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    imageView.alpha = 1;
    [UIView commitAnimations];
    
    index ++;
    
    [self performSelector:@selector(_startAnimation) withObject:self afterDelay:0.2];
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
