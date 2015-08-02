//
//  PhotoCollectionViewCell.m
//  Movie
//
//  Created by 弄潮者 on 15/7/23.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "PhotoCollectionViewCell.h"
#import "PhotoScrollView.h"

@implementation PhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _scrollView = [[PhotoScrollView alloc] initWithFrame:self.bounds];
        _scrollView.tag = 100;
        [self.contentView addSubview:_scrollView];
    }
    return self;
}

- (void)setImageUrl:(NSString *)imageUrl {
    _imageUrl = imageUrl;

    [self setNeedsLayout];
}

- (void)layoutSubviews {
//    [super layoutSubviews];
    _scrollView.imageUrlStr = _imageUrl;
}

@end
