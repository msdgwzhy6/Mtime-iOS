//
//  GuideViewController.h
//  Movie
//
//  Created by 弄潮者 on 15/7/27.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuideViewController : UIViewController<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *btn;

- (IBAction)btnAction:(id)sender;

@end
