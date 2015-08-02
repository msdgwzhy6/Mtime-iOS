//
//  IndexCollectionViewCell.h
//  Movie
//
//  Created by 弄潮者 on 15/7/25.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModal.h"

@interface IndexCollectionViewCell : UICollectionViewCell
{
    UIImageView *_imageView;
}
@property (nonatomic,retain) MovieModal *modal;


@end
