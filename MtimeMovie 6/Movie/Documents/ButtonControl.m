//
//  ButtonControl.m
//  Movie
//
//  Created by 弄潮者 on 15/7/17.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "ButtonControl.h"

@implementation ButtonControl

- (instancetype)initWithFrame:(CGRect)frame andImageName:(NSString *)imageName andTitle:(NSString *)title {
    if (self = [super initWithFrame:frame]) {
        _imageViewButton = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageViewButton.image = [UIImage imageNamed:imageName];
        _imageViewButton.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageViewButton];
        
        _lableButton = [[UILabel alloc] initWithFrame:CGRectZero];
        _lableButton.text = title;
        _lableButton.textColor = [UIColor whiteColor];
        _lableButton.textAlignment = NSTextAlignmentCenter;
        _lableButton.font = [UIFont systemFontOfSize:11];
        [self addSubview:_lableButton];
    }
    return self;
}

- (void)layoutSubviews {
    _imageViewButton.frame = CGRectMake((CGRectGetWidth(self.frame)-20)/2, 5, 20, 20);
    _lableButton.frame = CGRectMake(0, CGRectGetMaxY(_imageViewButton.frame), CGRectGetWidth(self.frame), 20);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
