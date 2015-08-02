//
//  NewsModal.m
//  Movie
//
//  Created by 弄潮者 on 15/7/21.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "NewsModal.h"

@implementation NewsModal

- (NSString *)description {
    return [NSString stringWithFormat:@"%i,%@,%@,%@",_newsType,_newsImage,_newsSummary,_newsTitle];
}


@end
