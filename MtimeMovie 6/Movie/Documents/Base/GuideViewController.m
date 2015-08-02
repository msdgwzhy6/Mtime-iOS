//
//  GuideViewController.m
//  Movie
//
//  Created by 弄潮者 on 15/7/27.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "GuideViewController.h"
#import "Header.h"
#import "LaunchViewController.h"

@interface GuideViewController ()

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    [self _creatSubviews];
    // Do any additional setup after loading the view from its nib.
}

- (void)_creatSubviews {
    _btn.hidden = YES;
    for (NSInteger i = 0 ; i < 5 ; i++ ) {
        NSString *imageName = [NSString stringWithFormat:@"guide%ld",i+1];
        UIImageView *imageView= [[UIImageView alloc] initWithFrame:CGRectMake(kwidth*i, 0, kwidth, kheight)];
        [imageView setImage:[UIImage imageNamed:imageName]];
        [_scrollView addSubview:imageView];
        
        NSString *progressImageName = [NSString stringWithFormat:@"guideProgress%ld",i+1];
        UIImageView *progressView = [[UIImageView alloc] initWithFrame:CGRectMake(kwidth*i + (kwidth-173)/2, kheight-50, 173, 26)];
        [progressView setImage:[UIImage imageNamed:progressImageName]];
        [_scrollView addSubview:progressView];
    }
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(kwidth*5, kheight);
    _scrollView.pagingEnabled = YES;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / kwidth;
    if (index == 4) {
        _btn.hidden = NO;
    }else {
        _btn.hidden = YES;
    }
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

- (IBAction)btnAction:(id)sender {
    LaunchViewController *vc = [[LaunchViewController alloc] init];
    self.view.window.rootViewController = vc;
}
@end
