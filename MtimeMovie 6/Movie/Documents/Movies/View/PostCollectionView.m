//
//  PostCollectionView.m
//  Movie
//
//  Created by 弄潮者 on 15/7/24.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "PostCollectionView.h"
#import "PostCollectionViewCell.h"
#import "MovieModal.h"
#import "Header.h"
#import "UIViewExt.h"



@implementation PostCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.dataSource = self;
        self.delegate = self;
//        self.pagingEnabled = YES;
        [self registerClass:[PostCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PostCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    MovieModal *modal = self.movieModalArray[indexPath.row];
    cell.modal = modal;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.currentIndex) {
        PostCollectionViewCell *cell = (PostCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//        cell.isBack = NO;
        [cell flipCell];
    }else {
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.currentIndex = indexPath.row;
    }
}

#pragma mark - 废代码
//- (void)setMovieModalArray:(NSArray *)movieModalArray {
//    _movieModalArray = movieModalArray;
//    [self reloadData];
//}

//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return _movieModalArray.count;
//}

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    return UIEdgeInsetsMake(0, (kwidth-self.itemWidth)/2, 0, (kwidth-self.itemWidth)/2);
//}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return CGSizeMake(self.itemWidth, self.height);
//}
//
//
//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
////    NSLog(@"~~~~~~~~~~~~~%f,%f",targetContentOffset->x,scrollView.contentOffset.x);
//    CGFloat x = targetContentOffset->x;
//    CGFloat item = self.itemWidth;
//    NSInteger index = x/item;
//    if (index <= 0) {
//        index = 0;
//    }else if (index >= self.movieModalArray.count) {
//        index = self.movieModalArray.count-1;
//    }
//    //    NSLog(@"index      %li",index);
//    targetContentOffset->x = item * index;
//
//    self.currentIndex = index;
//}

@end
