//
//  PosterView.m
//  Movie
//
//  Created by 弄潮者 on 15/7/24.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "PosterView.h"
#import "Header.h"
#import "UIViewExt.h"
#import "IndexCollectionView.h"
#import "MovieModal.h"

#define kHeaderViewH 136    //头部视图
#define kIndexCollectionViewH 100   //还白视图
#define kBottomTitleLableH 35
#define kBottomTitleLableY (kheight-ktabBarheight-kBottomTitleLableH)
#define kHeaderOffH   36
#define kPosterColletionViewY  (kHeaderViewH-kHeaderOffH)
#define kPosterColletionViewH  (kheight-kPosterColletionViewY-ktabBarheight-kBottomTitleLableH)

@implementation PosterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self _creatPosterCollectionView];
//        [self _creatBottomLabel];
        [self _creatCoverView];
        [self _creatSwipeGesture];
        [self _creatHeaderView];
        
        [_headerPosterCollectionView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
        [_PosterCollectionView addObserver:self forKeyPath:@"currentIndex" options:NSKeyValueObservingOptionNew context:nil];
        
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSNumber *number = change[@"new"];
    NSInteger index = [number integerValue];
    NSIndexPath *indexpath = [NSIndexPath indexPathForItem:index inSection:0];
    if ([object isKindOfClass:[PostCollectionView class]] && _headerPosterCollectionView.currentIndex != index) {
        [_headerPosterCollectionView scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        _headerPosterCollectionView.currentIndex = index;
    }else if ([object isKindOfClass:[IndexCollectionView class]] && _PosterCollectionView.currentIndex != index) {
        [_PosterCollectionView scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        _PosterCollectionView.currentIndex = index;
    }
    
    MovieModal *modal = _movieModalArray[index];
    _bottomLabel.text = modal.title;
    
    
}

#pragma mark - HeaderView
- (void)_creatHeaderView {
    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, -kHeaderOffH, kwidth, kHeaderViewH)];
//    _headerView.backgroundColor = [UIColor redColor];
    [self addSubview:_headerView];

    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:1];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:_headerView.bounds];
    imageView.image = image;
    [_headerView addSubview:imageView];
    
    //海报视图
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    _headerPosterCollectionView = [[IndexCollectionView alloc] initWithFrame:CGRectMake(0, 0, kwidth, kIndexCollectionViewH) collectionViewLayout:layout];
    _headerPosterCollectionView.itemWidth = kwidth/5;
    [_headerView addSubview:_headerPosterCollectionView];
    
    //按钮
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((kwidth-20)/2, kHeaderViewH-25, 20, 20)];
//    button.backgroundColor = [UIColor yellowColor];
    [button setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(pullAction:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 218;
    [_headerView addSubview:button];
}

- (void)pullAction:(UIButton *)btn {
    if (btn.selected == NO) {
        [self _showView];
    }else {
        [self _hiddenView];
    }
    btn.selected = !btn.selected;
}

- (void)_showView {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    _headerView.top = knavHeight;
    _coverView.hidden = NO;
    [UIView commitAnimations];
}

- (void)_hiddenView {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    _headerView.top = -kHeaderOffH;
    _coverView.hidden = YES;
    [UIView commitAnimations];
}

#pragma mark - SwipeGesture
- (void)_creatSwipeGesture {
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipeDown];
}

- (void)swipeDown {
    [self _showView];
    UIButton *btn =  (UIButton *)[_headerView viewWithTag:218];
    btn.selected = !btn.selected;
}

#pragma mark - CoverView
- (void)_creatCoverView {
    _coverView = [[UIControl alloc] initWithFrame:self.bounds];
    _coverView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.8];
    _coverView.hidden = YES;
    [_coverView addTarget:self action:@selector(coverViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview: _coverView];
}

- (void)coverViewAction:(UIControl *)ctrl {
    [self _hiddenView];
    UIButton *btn =  (UIButton *)[_headerView viewWithTag:218];
    btn.selected = !btn.selected;
}

#pragma mark - PosterCollection
- (void)_creatPosterCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    _PosterCollectionView = [[PostCollectionView alloc] initWithFrame:CGRectMake(0, kPosterColletionViewY, kwidth, kPosterColletionViewH) collectionViewLayout:layout];
    _PosterCollectionView.itemWidth = kwidth*3/4;
//    _PosterCollectionView.backgroundColor = [UIColor grayColor];
    [self addSubview:_PosterCollectionView];
}

#pragma mark - BottomLabel
- (void)_creatBottomLabel {
    _bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kBottomTitleLableY, kwidth, kBottomTitleLableH)];
    _bottomLabel.backgroundColor = [UIColor clearColor];
    _bottomLabel.textColor = [UIColor whiteColor];
    _bottomLabel.textAlignment = NSTextAlignmentCenter;
    
    MovieModal *modal = _movieModalArray[0];
    _bottomLabel.text = modal.title;
    
    
    [self addSubview:_bottomLabel];
}

- (void)setMovieModalArray:(NSArray *)movieModalArray {
    _movieModalArray = movieModalArray;
    _PosterCollectionView.movieModalArray = _movieModalArray;
    _headerPosterCollectionView.movieModalArray = _movieModalArray;
    [self _creatBottomLabel];
}

@end
