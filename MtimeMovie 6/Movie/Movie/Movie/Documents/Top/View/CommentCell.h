//
//  CommentCell.h
//  Movie
//
//  Created by 弄潮者 on 15/7/27.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModal.h"

@interface CommentCell : UITableViewCell
//@property (weak, nonatomic) IBOutlet UIImageView *userImage;
//@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
//@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
//@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;
//@property (weak, nonatomic) IBOutlet UIView *backGroundView;
@property (nonatomic,retain) UILabel *commentLabel;
@property (nonatomic,retain) UIImageView *imageViewBackGround;
@property (nonatomic,retain) UILabel *nickNameLabel;
@property (nonatomic,retain) UILabel *ratingLabel;
@property (nonatomic,retain) UIImageView *userImage;

@property (nonatomic,retain) CommentModal *modal;

@end
