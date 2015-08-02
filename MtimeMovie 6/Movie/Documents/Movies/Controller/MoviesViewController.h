//
//  MoviesViewController.h
//  Movie
//
//  Created by 弄潮者 on 15/7/17.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "PosterView.h"

@interface MoviesViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_movieListTable;
    PosterView *_posterView;
}
@end
