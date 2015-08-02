//
//  CinemaCell.m
//  Movie
//
//  Created by 弄潮者 on 15/7/22.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "CinemaCell.h"

@implementation CinemaCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModal:(CinemaModal *)modal {
    _modal = modal;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];

    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _cinemaNameLabel.text = [NSString stringWithFormat:@"%@",_modal.name];
    _gradeLabel.text = [NSString stringWithFormat:@"%@",_modal.grade];
    _addressLabel.text = _modal.address;
    
    BOOL seat = [_modal.isSeatSupport boolValue];
    BOOL coupon = [_modal.isCouponSupport boolValue];
    _seatView.hidden = (seat)?NO:YES;
    _couponView.hidden = (coupon)?NO:YES;
    
    float iii = [_modal.lowPrice floatValue];
    _priceLabel.textAlignment = NSTextAlignmentRight;
    if (iii == -1) {
        _priceLabel.hidden = YES;
    }else {
        _priceLabel.hidden = NO;
        _priceLabel.text = [NSString stringWithFormat:@"￥%.2f",iii];
    }
    
    _distanceLabel.textAlignment = NSTextAlignmentRight;
    _distanceLabel.text = [NSString stringWithFormat:@"%.0fkm",iii];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
