//
//  StarView.m
//  Movie
//
//  Created by 弄潮者 on 15/7/21.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "StarView.h"

@implementation StarView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self _creatSubview];
    }
    return self;
}

- (void)awakeFromNib {
    [self _creatSubview];
}

- (void)_creatSubview {
    UIImage *yellow = [UIImage imageNamed:@"yellow"];
    UIImage *gray = [UIImage imageNamed:@"gray"];
    
    _yellowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5*yellow.size.width, yellow.size.height)];
    _yellowView.backgroundColor = [UIColor colorWithPatternImage:yellow];
    
    _grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5*gray.size.width, gray.size.height)];
    _grayView.backgroundColor = [UIColor colorWithPatternImage:gray];
    
    //放大倍数
    float scale  = self.frame.size.height/yellow.size.height;
    
    _yellowView.transform = CGAffineTransformMakeScale(scale, scale);
    _grayView.transform = CGAffineTransformMakeScale(scale, scale);
    
    //放大后的坐标调整
    CGRect frame = _grayView.frame;
    frame.origin = CGPointZero;
    
    _yellowView.frame = frame;
    _grayView.frame = frame;
    
    [self addSubview:_grayView];
    [self addSubview:_yellowView];
}


- (void)setAverage:(float)average {
    _average = average;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    float width = _average/10.0 * _grayView.frame.size.width;
    CGRect frame = _grayView.frame;
    
    frame.size.width = width;
    _yellowView.frame = frame;
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
