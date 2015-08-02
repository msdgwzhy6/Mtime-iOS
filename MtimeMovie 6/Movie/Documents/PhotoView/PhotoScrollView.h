//
//  PhotoScrollView.h
//  Movie
//
//  Created by 弄潮者 on 15/7/23.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScrollView : UIScrollView<UIScrollViewDelegate>
{
    UIImageView *_imageView;
}
@property (nonatomic,copy) NSString *imageUrlStr;

@end
