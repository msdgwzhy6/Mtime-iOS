//
//  NewsImageCell.m
//  Movie
//
//  Created by 弄潮者 on 15/7/22.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "NewsImageCell.h"
#import "UIImageView+WebCache.h"

@implementation NewsImageCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self _creatSubview];
    }
    return self;
}

- (void)_creatSubview {
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _imageView.layer.cornerRadius = 10;
    _imageView.layer.borderWidth = 1;
    _imageView.layer.borderColor = [UIColor grayColor].CGColor;
    _imageView.layer.masksToBounds = YES;
    
    [self.contentView addSubview:_imageView];
    
}

- (void)setModal:(NewsImageModal *)modal {
    _modal = modal;
    [self setNeedsLayout];  
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSString *str = _modal.image;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:str]];
    
}

@end
