//
//  TopPsterModal.m
//  Movie
//
//  Created by 弄潮者 on 15/7/27.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "TopPsterModal.h"

@implementation TopPsterModal

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"release"]) {
        _releaseDic = value;
    }
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@,%@,%@,%@,%@,%@,%@,%@",_actors,_directors,_image,_images,_releaseDic,_titleCn,_type,_videos];
}



@end
