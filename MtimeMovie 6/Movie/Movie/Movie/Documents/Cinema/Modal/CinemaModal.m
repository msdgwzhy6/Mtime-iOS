//
//  CinemaModal.m
//  Movie
//
//  Created by 弄潮者 on 15/7/22.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "CinemaModal.h"

@implementation CinemaModal

- (NSString *)description {
    return [NSString stringWithFormat:@"%@,%@,%@,%@,%@,%@,%@,%@",_name,_address,_districtId,_grade,_distance,_lowPrice,_isCouponSupport,_isSeatSupport];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqualToString:@"distance"]) {
        _distance = @"10";
    }else if ([key isEqualToString:@"lowPrice"]) {
        _lowPrice = @"-1";
    }else {
        [super setNilValueForKey:key];
    }
}


@end
