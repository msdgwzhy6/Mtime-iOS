//
//  MoreCell.h
//  Movie
//
//  Created by 弄潮者 on 15/7/23.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MoreModal.h"

@interface MoreCell : UITableViewCell
{
    UIButton *_button;
}
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *clearNumberLabel;



@property (nonatomic,retain) MoreModal *modal;

@end
