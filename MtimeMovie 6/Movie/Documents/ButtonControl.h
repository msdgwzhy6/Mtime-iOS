//
//  ButtonControl.h
//  Movie
//
//  Created by 弄潮者 on 15/7/17.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonControl : UIControl
{
    UIImageView *_imageViewButton;
    UILabel *_lableButton;
}

- (instancetype)initWithFrame:(CGRect)frame andImageName:(NSString *)imageName andTitle:(NSString *)title;

@end
