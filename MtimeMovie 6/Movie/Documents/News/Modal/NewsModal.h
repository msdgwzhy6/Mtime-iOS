//
//  NewsModal.h
//  Movie
//
//  Created by 弄潮者 on 15/7/21.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModal : NSObject

@property (nonatomic,assign) int newsType;
@property (nonatomic,copy) NSString *newsTitle;
@property (nonatomic,copy) NSString *newsSummary;
@property (nonatomic,copy) NSString *newsImage;

@end
