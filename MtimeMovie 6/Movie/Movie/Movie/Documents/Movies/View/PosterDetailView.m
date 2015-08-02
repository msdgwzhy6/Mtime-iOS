//
//  PosterDetailView.m
//  Movie
//
//  Created by 弄潮者 on 15/7/25.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "PosterDetailView.h"
#import "UIImageView+WebCache.h"

@implementation PosterDetailView

- (void)setModal:(MovieModal *)modal {
    _modal = modal;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_movieImageView sd_setImageWithURL:[NSURL URLWithString:_modal.images[@"large"]]];
    _titleLabel.text = _modal.title;
    _yearLabel.text = [NSString stringWithFormat:@"年份:%@",_modal.year];
    _englishTitleLabel.text = _modal.title;
    _averageLabel.text = [NSString stringWithFormat:@"%.1f",_modal.average];
    _starView.average = _modal.average;
}

@end
