//
//  TopCell.m
//  Movie
//
//  Created by 弄潮者 on 15/7/21.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "TopCell.h"
#import "TopModal.h"
#import "StarView.h"
#import "UIImageView+WebCache.h"

@implementation TopCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModal:(TopModal *)modal {
    _modal = modal;
    _starTopView.average = modal.average;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _nameLable.text = _modal.title;
    _averageLable.text = [NSString stringWithFormat:@"%.1f",_modal.average];
    
    NSString *str = _modal.images[@"medium"];
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:str]];
    
}


@end
