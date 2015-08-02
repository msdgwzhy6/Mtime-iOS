//
//  DistrictModal.m
//  Movie
//
//  Created by 弄潮者 on 15/7/22.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "DistrictModal.h"

@implementation DistrictModal

- (NSString *)description {
    return [NSString stringWithFormat:@"%@,%ld,%@",_cinemaListArray,(long)_disId,_name];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        _disId = [value integerValue];
    }
}

@end
