//
//  PosterView.h
//  Movie
//
//  Created by 弄潮者 on 15/7/24.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PostCollectionView.h"
#import "IndexCollectionView.h"

@interface PosterView : UIView
{
    UIView *_headerView;
    PostCollectionView *_PosterCollectionView;
    UILabel *_bottomLabel;
    UIControl *_coverView;
    IndexCollectionView *_headerPosterCollectionView;
    
}

@property (nonatomic,retain) NSArray *movieModalArray;

@end
