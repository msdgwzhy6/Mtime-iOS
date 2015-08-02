//
//  TopCollectionView.h
//  Movie
//
//  Created by 弄潮者 on 15/7/27.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopPsterModal.h"

@interface TopCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,retain) TopPsterModal *modal;

@end
