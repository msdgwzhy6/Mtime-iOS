//
//  MovieCell.h
//  Movie
//
//  Created by 弄潮者 on 15/7/20.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModal.h"
#import "StarView.h"

@interface MovieCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *yearLable;
@property (weak, nonatomic) IBOutlet UILabel *averageLale;
@property (weak, nonatomic) IBOutlet StarView *starView;


@property (nonatomic,retain) MovieModal *modal;
@end
