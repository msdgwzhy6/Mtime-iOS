//
//  PhotoCollectionViewCell.h
//  Movie
//
//  Created by 弄潮者 on 15/7/23.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoScrollView.h"

@interface PhotoCollectionViewCell : UICollectionViewCell
{
    PhotoScrollView *_scrollView;
}
@property (nonatomic,copy) NSString *imageUrl;
@end
