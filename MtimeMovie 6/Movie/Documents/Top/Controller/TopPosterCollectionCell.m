//
//  TopPosterCollectionCell.m
//  Movie
//
//  Created by 弄潮者 on 15/7/27.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "TopPosterCollectionCell.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"

@implementation TopPosterCollectionCell

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
    _imageView.layer.cornerRadius = 10;
    _imageView.layer.borderWidth = 1;
    _imageView.layer.borderColor = [UIColor blackColor].CGColor;
    _imageView.layer.masksToBounds = YES;
    [self.contentView addSubview:_imageView];
}

- (void)setImageName:(NSString *)imageName {
    _imageName  = imageName;
    [self setNeedsLayout];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_imageName]];
}

@end
