//
//  MovieModal.h
//  Movie
//
//  Created by 弄潮者 on 15/7/20.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModal : NSObject

@property (nonatomic,copy) NSString *year;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,retain) NSDictionary *images;
@property (nonatomic,assign) float average;

@end
