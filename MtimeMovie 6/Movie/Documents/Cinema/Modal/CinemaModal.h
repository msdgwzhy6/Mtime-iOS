//
//  CinemaModal.h
//  Movie
//
//  Created by 弄潮者 on 15/7/22.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CinemaModal : NSObject

//@property (nonatomic,copy) NSString *name;
//@property (nonatomic,copy) NSString *address;
//
//@property (nonatomic,assign) NSInteger districtId;
//@property (nonatomic,assign) float grade;
//@property (nonatomic,assign) float distance;
//@property (nonatomic,assign) float lowPrice;
//
//@property (nonatomic,assign) BOOL isCouponSupport;
//@property (nonatomic,assign) BOOL isSeatSupport;

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *address;

@property (nonatomic,copy) NSString *districtId;
@property (nonatomic,copy) NSString *grade;
@property (nonatomic,copy) NSString *distance;
@property (nonatomic,copy) NSString *lowPrice;

@property (nonatomic,copy) NSString *isCouponSupport;
@property (nonatomic,copy) NSString *isSeatSupport;

@end
