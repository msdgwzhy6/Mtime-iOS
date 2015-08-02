//
//  MovieCell.m
//  Movie
//
//  Created by 弄潮者 on 15/7/20.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "MovieCell.h"
#import "UIImageView+WebCache.h"
#import "StarView.h"

@implementation MovieCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModal:(MovieModal *)modal {
    _modal = modal;
    _starView.average = modal.average;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];

    _yearLable.text = [NSString stringWithFormat:@"年份:%@",_modal.year];
    _titleLable.text = _modal.title;
    _averageLale.text = [NSString stringWithFormat:@"%.1f",_modal.average];
    NSString *str = _modal.images[@"medium"];
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:str]];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
//    UIImage *image1 = [UIImage imageNamed:@"yellow"];
//    UIImage *image2 = [UIImage imageNamed:@"gray"];
//    
//    float star = _modal.average/10.0*5;
//    
//    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, star*image1.size.width, image1.size.height)];
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5*image2.size.width, image2.size.height)];
//    view1.backgroundColor = [UIColor colorWithPatternImage:image1];
//    view2.backgroundColor = [UIColor colorWithPatternImage:image2];
//    
//    [_starView addSubview:view2];
//    [_starView addSubview:view1];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
