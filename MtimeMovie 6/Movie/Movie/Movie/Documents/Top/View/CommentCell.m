//
//  CommentCell.m
//  Movie
//
//  Created by 弄潮者 on 15/7/27.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "CommentCell.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt.h"
#import "Header.h"

@implementation CommentCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier  {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self _creatSubview];
    }
    return self;
}

- (void)_creatSubview {
    _nickNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 10, kwidth-80, 25)];
    _commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 40, kwidth-80, 20)];
    _imageViewBackGround = [[UIImageView alloc] initWithFrame:CGRectMake(70, 5, kwidth-80, 65)];
    _ratingLabel = [[UILabel alloc] initWithFrame:CGRectMake(kwidth-50, 10, 35, 25)];
    _userImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 60, 60)];
    
    [self addSubview:_imageViewBackGround];
    [self addSubview:_commentLabel];
    [self addSubview:_nickNameLabel];
    [self addSubview:_ratingLabel];
    [self addSubview:_userImage];
}

- (void)setModal:(CommentModal *)modal {
    _modal = modal;
    [self setNeedsLayout];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    

    self.backgroundColor = [UIColor blackColor];
    _imageViewBackGround.backgroundColor = [UIColor whiteColor];
    _imageViewBackGround.layer.cornerRadius = 10;
    _imageViewBackGround.layer.borderWidth = 1;
    _imageViewBackGround.layer.borderColor = [UIColor blackColor].CGColor;
    _imageViewBackGround.layer.masksToBounds = YES;

    
    NSString *image = _modal.userImage;
    [_userImage sd_setImageWithURL:[NSURL URLWithString:image]];
    _userImage.layer.cornerRadius = 10;
    _userImage.layer.borderWidth = 1;
    _userImage.layer.borderColor = [UIColor blackColor].CGColor;
    _userImage.layer.masksToBounds = YES;

    
    _nickNameLabel.text = _modal.nickname;
    _commentLabel.text = _modal.content;
    _commentLabel.font = [UIFont systemFontOfSize:18];
    
    _ratingLabel.text = [NSString stringWithFormat:@"%.1f",_modal.rating];

}

@end
