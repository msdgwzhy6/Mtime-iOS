//
//  DataService.h
//  Movie
//
//  Created by 弄潮者 on 15/7/21.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataService : NSObject

+ (id)getJsonDataFromFile:(NSString *)fileName;

@end
