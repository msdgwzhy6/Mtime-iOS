//
//  CommentModal.m
//  Movie
//
//  Created by 弄潮者 on 15/7/27.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "CommentModal.h"

@implementation CommentModal

- (NSString *)description {
    return [NSString stringWithFormat:@"%@,%@,%f,%@",_content,_nickname,_rating,_userImage];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
