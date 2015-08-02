//
//  PhotoScrollView.m
//  Movie
//
//  Created by 弄潮者 on 15/7/23.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "PhotoScrollView.h"
#import "UIImageView+WebCache.h"

@implementation PhotoScrollView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];
        [self _zooming];

    }
    return self;
}

- (void)setImageUrlStr:(NSString *)imageUrlStr {
    _imageUrlStr = imageUrlStr;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_imageUrlStr]];
}

#pragma mark -ZOOMing
- (void)_zooming {
    self.delegate = self;
    self.maximumZoomScale = 3;
    self.minimumZoomScale = 1;
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTap)];
    //        敲击数目
    doubleTap.numberOfTapsRequired = 2;
    //        触摸点
    doubleTap.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:doubleTap];
    
    //默认手势，单击
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap)];
    
    [self addGestureRecognizer:singleTap];
    //双击的时候，单击失效
    [singleTap requireGestureRecognizerToFail:doubleTap];
}

- (void)singleTap {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"hideNavgationBar" object:nil];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _imageView;
}

- (void)doubleTap {
    if (self.zoomScale == 1) {
        [self setZoomScale:3 animated:YES];
    }else {
        [self setZoomScale:1 animated:YES];
    }
}

@end
