//
//  TopPosterView.m
//  Movie
//
//  Created by 弄潮者 on 15/7/27.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "TopPosterView.h"
#import "DataService.h"
#import "UIImageView+WebCache.h"
#import "TopCollectionView.h"
#import "Header.h"

@implementation TopPosterView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        [self _creatView];
        [self _creatCollectionView];
    }
    return self;
}

- (void)setModal:(TopPsterModal *)modal {
    [self _creatCollectionView];

    _modal = modal;
    _imagesCollectionView.modal = _modal;
    [self _creatView];
}

- (void)_creatView {
    self.backgroundColor = [UIColor blackColor];
    
    NSString *imageName = _modal.image;
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 110, 150)];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:imageName]];
    
    
    _titleCnLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 5, kwidth-120, 30)];
    [_titleCnLabel setFont:[UIFont systemFontOfSize:24]];
    _titleCnLabel.textColor = [UIColor brownColor];
    _titleCnLabel.text = _modal.titleCn;
    
    
    _directorsLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 45,  kwidth-120, 25)];
    NSMutableString *mutableStr = [[NSMutableString alloc] init];
    for (NSString *str in _modal.directors) {
        [mutableStr appendFormat:@"%@ ",str];
    }
    _directorsLabel.textColor = [UIColor whiteColor];
    [_directorsLabel setFont:[UIFont systemFontOfSize:18]];
    _directorsLabel.text = [NSString stringWithFormat:@"导演:%@",mutableStr];
    
    
    _actorsLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 70,  kwidth-120, 25)];
    NSMutableString *mutableStr1 = [[NSMutableString alloc] init];
    for (NSString *str in _modal.actors) {
        [mutableStr1 appendFormat:@"%@ ",str];
    }
    _actorsLabel.textColor = [UIColor whiteColor];
    [_actorsLabel setFont:[UIFont systemFontOfSize:18]];
    _actorsLabel.text = [NSString stringWithFormat:@"主演:%@",mutableStr1];
    
    
    _typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 95,  kwidth-120, 25)];
    NSMutableString *mutableStr2 = [[NSMutableString alloc] init];
    for (NSString *str in _modal.type) {
        [mutableStr2 appendFormat:@"%@ ",str];
    }
    _typeLabel.textColor = [UIColor whiteColor];
    [_typeLabel setFont:[UIFont systemFontOfSize:18]];
    _typeLabel.text = [NSString stringWithFormat:@"类型:%@",mutableStr2];
    
    
    _releaseLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 120,  kwidth-120, 25)];
    [_releaseLabel setFont:[UIFont systemFontOfSize:18]];
    NSString *str1 = _modal.releaseDic[@"location"];
    NSString *str2 = _modal.releaseDic[@"date"];
    _releaseLabel.textColor = [UIColor whiteColor];
    NSString *str = [NSString stringWithFormat:@"%@ %@",str1,str2];
    _releaseLabel.text = str;
    
    [self addSubview:_imageView];
    [self addSubview:_titleCnLabel];
    [self addSubview:_directorsLabel];
    [self addSubview:_actorsLabel];
    [self addSubview:_typeLabel];
    [self addSubview:_releaseLabel];
}

- (void)_creatCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    _imagesCollectionView = [[TopCollectionView alloc] initWithFrame:CGRectMake(5, 165, kwidth-10, 80) collectionViewLayout:layout];
    [self addSubview:_imagesCollectionView];
}

@end
