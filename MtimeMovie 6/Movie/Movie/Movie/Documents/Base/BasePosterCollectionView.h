//
//  BasePosterCollectionView.h
//  Movie
//
//  Created by 弄潮者 on 15/7/25.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasePosterCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,retain) NSArray *movieModalArray;
@property (nonatomic,assign) CGFloat itemWidth;
@property (nonatomic,assign) NSInteger currentIndex;


@end
