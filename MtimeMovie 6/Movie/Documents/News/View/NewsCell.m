//
//  NewsCell.m
//  Movie
//
//  Created by 弄潮者 on 15/7/21.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "NewsCell.h"
#import "UIImageView+WebCache.h"


@implementation NewsCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setNewsModal:(NewsModal *)newsModal {
    _newsModal = newsModal;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
//    NSLog(@"%i,%@",_newsModal.newsType,_newsModal.newsTitle);
    [super layoutSubviews];
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    if (_newsModal.newsType == 1) {
        _newsSmallPicture.image = [UIImage imageNamed:@"sctpxw"];
        CGRect frame = _newsSummaryLabel.frame;
        frame.origin.x = 129;
        frame.size.width = _newsTitleLabel.frame.size.width;
        _newsSummaryLabel.frame = frame;

    }else if (_newsModal.newsType == 2) {
        _newsSmallPicture.image = [UIImage imageNamed:@"scspxw"];
        CGRect frame = _newsSummaryLabel.frame;
        frame.origin.x = 129;
        frame.size.width = _newsTitleLabel.frame.size.width;
        _newsSummaryLabel.frame = frame;

    }else {
        _newsSmallPicture.image = nil;
        CGRect frame = _newsSummaryLabel.frame;
        frame.origin.x = 103;
        frame.size.width = _newsTitleLabel.frame.size.width;
        _newsSummaryLabel.frame = frame;
    }
    
    _newsTitleLabel.text = _newsModal.newsTitle;
    _newsSummaryLabel.text = _newsModal.newsSummary;
    [_newsIconImage sd_setImageWithURL:[NSURL URLWithString:_newsModal.newsImage]];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
