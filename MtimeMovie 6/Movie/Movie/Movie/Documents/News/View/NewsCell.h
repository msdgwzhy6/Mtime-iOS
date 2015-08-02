//
//  NewsCell.h
//  Movie
//
//  Created by 弄潮者 on 15/7/21.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModal.h"


@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *newsIconImage;
@property (weak, nonatomic) IBOutlet UILabel *newsTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *newsSummaryLabel;
@property (weak, nonatomic) IBOutlet UIImageView *newsSmallPicture;


@property (nonatomic,retain) NewsModal *newsModal;

@end
