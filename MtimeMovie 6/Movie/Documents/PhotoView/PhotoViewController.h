//
//  PhotoViewController.h
//  Movie
//
//  Created by 弄潮者 on 15/7/23.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoCollectionView.h"

@interface PhotoViewController : UIViewController
{
    PhotoCollectionView *_collectionView;
}

@property (nonatomic,retain) NSArray *imageUrlArray;
@property (nonatomic,assign) NSInteger currentIndex;

@end
