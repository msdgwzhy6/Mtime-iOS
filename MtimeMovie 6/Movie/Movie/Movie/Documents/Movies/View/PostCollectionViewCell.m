//
//  PostCollectionViewCell.m
//  Movie
//
//  Created by 弄潮者 on 15/7/24.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "PostCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "Header.h"
#import "UIViewExt.h"

@implementation PostCollectionViewCell

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
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSArray *views = [bundle loadNibNamed:@"PosterDetailView" owner:self options:nil];
    
    _postDetailView = [views lastObject];
    _postDetailView.frame = CGRectMake((self.width-imageWidth)/2, (self.height-imageHeight)/2, imageWidth, imageHeight);
    _postDetailView.hidden = YES;
    _postDetailView.modal = _modal;
    _postDetailView.backgroundColor = [UIColor darkGrayColor];
    [self.contentView addSubview:_postDetailView];
    
    
}

- (void)setModal:(MovieModal *)modal {
    _modal = modal;
    _postDetailView.modal = _modal;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (_isBack == YES) {
        _postDetailView.hidden = NO;
        _imageView.hidden = YES;
    }else {
        _postDetailView.hidden = YES;
        _imageView.hidden = NO;
    }
    
    
    NSString *str = _modal.images[@"large"];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:str]];
}

- (void)flipCell {
    [self _flipView:self andIsLeft:_imageView.hidden];
    _imageView.hidden = !_imageView.hidden;
    _postDetailView.hidden = !_postDetailView.hidden;
}

- (void)_flipView:(UIView *)view andIsLeft:(BOOL)Left {
    UIViewAnimationOptions option = Left?UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight;
    [UIView transitionWithView:view duration:0.5 options:option animations:nil completion:nil];
}

@end
