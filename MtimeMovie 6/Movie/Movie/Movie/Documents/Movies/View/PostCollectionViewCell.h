//
//  PostCollectionViewCell.h
//  Movie
//
//  Created by 弄潮者 on 15/7/24.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PosterDetailView.h"
#import "MovieModal.h"

@interface PostCollectionViewCell : UICollectionViewCell
{
    PosterDetailView *_postDetailView;
    UIImageView *_imageView;
}
//@property (nonatomic,retain) NSString *imageUrlStr;
@property (nonatomic,retain) MovieModal *modal;
@property (nonatomic,assign) BOOL isBack;   //记录显示正反，如果有需要实现 先点击反面，划过去以后回来，仍然反面的话就需要这个参数，同时需要有成员变量记录他的变化情况;本例没有实现

- (void)flipCell;

@end
