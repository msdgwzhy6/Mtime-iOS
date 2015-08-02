//
//  StarView.h
//  Movie
//
//  Created by 弄潮者 on 15/7/21.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
{
    UIView *_yellowView;
    UIView *_grayView;
}

@property (nonatomic,assign) float average;

@end
