//
//  CommentModal.h
//  Movie
//
//  Created by 弄潮者 on 15/7/27.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentModal : NSObject

@property (nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSString *nickname;
@property (nonatomic,assign) float rating;
@property (nonatomic,copy) NSString *userImage;

@end
