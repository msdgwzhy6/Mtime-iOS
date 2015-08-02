//
//  TopPsterModal.h
//  Movie
//
//  Created by 弄潮者 on 15/7/27.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopPsterModal : NSObject

@property (nonatomic,retain) NSArray *actors;
@property (nonatomic,retain) NSArray *directors;
@property (nonatomic,copy) NSString *image;
@property (nonatomic,retain) NSArray *images;
@property (nonatomic,retain) NSDictionary *releaseDic;
@property (nonatomic,copy) NSString *titleCn;
@property (nonatomic,retain) NSArray *type;
@property (nonatomic,retain) NSArray *videos;

@end
