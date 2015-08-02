//
//  NewsImageCell.h
//  Movie
//
//  Created by 弄潮者 on 15/7/22.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsImageModal.h"

@interface NewsImageCell : UICollectionViewCell
//@property (weak, nonatomic) IBOutlet UIImageView *imageView;
{
    UIImageView *_imageView;
}
@property (nonatomic,retain) NewsImageModal *modal;

@end
