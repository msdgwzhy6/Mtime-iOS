//
//  IndexCollectionViewCell.m
//  Movie
//
//  Created by 弄潮者 on 15/7/25.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "IndexCollectionViewCell.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"

@implementation IndexCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self _creatSubviews];
    }
    return self;
}

- (void)_creatSubviews {
    CGFloat imageWidth = self.width*0.9;
    CGFloat imageHeight = self.height*0.9;
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.width-imageWidth)/2, (self.height-imageHeight)/2, imageWidth, imageHeight)];
    [self.contentView addSubview:_imageView];
}

- (void)setModal:(MovieModal *)modal {
    _modal = modal;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSString *str = _modal.images[@"large"];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:str]];
}


@end
