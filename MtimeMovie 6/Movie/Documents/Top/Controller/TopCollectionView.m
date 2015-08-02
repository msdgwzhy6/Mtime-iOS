//
//  TopCollectionView.m
//  Movie
//
//  Created by 弄潮者 on 15/7/27.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "TopCollectionView.h"
#import "TopPosterCollectionCell.h"
#import "TopPsterModal.h"
#import "UIViewExt.h"
#import <MediaPlayer/MediaPlayer.h>
#import "CommentViewController.h"

@implementation TopCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.layer.cornerRadius = 10;
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.masksToBounds = YES;
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[TopPosterCollectionCell class] forCellWithReuseIdentifier:@"cell"];
    }
    return self;
}

- (void)setModal:(TopPsterModal *)modal {
    _modal = modal;
//    NSLog(@"ttttttttttt %@",_modal);
    [self reloadData];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TopPosterCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row < _modal.images.count) {
        NSString *imageName = _modal.images[indexPath.row];
        cell.imageName = imageName;
    }else {
        NSInteger i =indexPath.row - _modal.images.count;
        NSString *imageName = _modal.videos[i][@"image"];
        cell.imageName = imageName;
    }
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _modal.images.count + _modal.videos.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.width/3, self.height);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row >= _modal.images.count) {
        NSInteger i = indexPath.row - _modal.images.count;
        
        NSDictionary *dic = @{@"returnInfo" : _modal.videos[i][@"url"]};
        NSNotification *notification = [NSNotification notificationWithName:@"chuanzhi" object:nil userInfo:dic];
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }
}


@end
