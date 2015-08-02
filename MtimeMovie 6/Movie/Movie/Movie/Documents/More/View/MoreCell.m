//
//  MoreCell.m
//  Movie
//
//  Created by 弄潮者 on 15/7/23.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "MoreCell.h"
#import "MoreModal.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"

@implementation MoreCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (void)setModal:(MoreModal *)modal {
    _modal = modal;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundColor = [UIColor blackColor];
    if ([_modal.title isEqualToString:@"清除缓存"]) {
        SDImageCache *cache = [[SDImageCache alloc] init];
        float size = [cache getSize];
        _clearNumberLabel.text = [NSString stringWithFormat:@"%.1fM",size/1000/1000];
        _clearNumberLabel.hidden = NO;
    }else {
        _clearNumberLabel.hidden = YES;
    }
    _iconImageView.image = [UIImage imageNamed:_modal.iconImage];
    _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    _titleLabel.text = _modal.title;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end
