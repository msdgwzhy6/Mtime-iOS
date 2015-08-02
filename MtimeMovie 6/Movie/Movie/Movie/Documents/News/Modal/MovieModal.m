//
//  MovieModal.m
//  Movie
//
//  Created by 弄潮者 on 15/7/20.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "MovieModal.h"

@implementation MovieModal

- (NSString *)description {
    return [NSString stringWithFormat:@"%@,%@,%@,%f",_year,_title,_images,_average];
}

@end

