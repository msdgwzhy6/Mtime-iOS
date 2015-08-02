//
//  TopCell.h
//  Movie
//
//  Created by 弄潮者 on 15/7/21.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopModal.h"
#import "StarView.h"

@interface TopCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *averageLable;
@property (weak, nonatomic) IBOutlet StarView *starTopView;

@property (nonatomic,retain) TopModal *modal;
@end
