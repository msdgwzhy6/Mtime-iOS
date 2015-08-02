//
//  TopPosterView.h
//  Movie
//
//  Created by 弄潮者 on 15/7/27.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopPsterModal.h"
#import "TopCollectionView.h"

@interface TopPosterView : UIView
{
    UIImageView *_imageView;
    UILabel *_titleCnLabel;
    UILabel *_directorsLabel;
    UILabel *_actorsLabel;
    UILabel *_typeLabel;
    UILabel *_releaseLabel;
//    UICollectionView *_imagesCollectionView;
    
    TopCollectionView *_imagesCollectionView;
}
@property (nonatomic,retain) TopPsterModal *modal;

@end
