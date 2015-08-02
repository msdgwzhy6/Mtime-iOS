//
//  BasePosterCollectionView.m
//  Movie
//
//  Created by 弄潮者 on 15/7/25.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "BasePosterCollectionView.h"
#import "MovieModal.h"
#import "Header.h"
#import "UIViewExt.h"

@implementation BasePosterCollectionView
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

- (void)setMovieModalArray:(NSArray *)movieModalArray {
    _movieModalArray = movieModalArray;
    [self reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _movieModalArray.count;
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, (kwidth-_itemWidth)/2, 0, (kwidth-_itemWidth)/2);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(_itemWidth, self.height);
}

//子类会重写这个方法
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    CGFloat x = targetContentOffset->x;
    CGFloat item = _itemWidth;
    NSInteger index = x/item;
    if (index <= 0) {
        index = 0;
    }else if (index >= _movieModalArray.count) {
        index = _movieModalArray.count-1;
    }
    targetContentOffset->x = item * index;
    self.currentIndex = index;
}



@end
