//
//  MoviesViewController.m
//  Movie
//
//  Created by 弄潮者 on 15/7/17.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieModal.h"
#import "MovieCell.h"
#import "Header.h"
#import "DataService.h"

@interface MoviesViewController ()
{
    NSMutableArray *_movieModalArray;
}
@end

@implementation MoviesViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"电影";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self _creatNav];
    [self _creatTableView];
    [self _creatPosterView];

    [self _loadData];
    // Do any additional setup after loading the view.
}

//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleLightContent;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_loadData {
    NSDictionary *dataDic = [DataService getJsonDataFromFile:@"us_box.json"];
    
    _movieModalArray = [NSMutableArray array];
    NSArray *subjects = dataDic[@"subjects"];
    for (NSDictionary *dic in subjects) {
        NSDictionary *subject = dic[@"subject"];
        MovieModal *modal = [[MovieModal alloc] init];
        modal.year = subject[@"year"];
        modal.title = subject[@"title"];
        modal.images = subject[@"images"];
        NSNumber *num = subject[@"rating"][@"average"];
        modal.average = [num floatValue];
        
//        NSLog(@"%@",modal);
        [_movieModalArray addObject:modal];
    }
    _posterView.movieModalArray = _movieModalArray;
}



#pragma mark - NavController
- (void)_creatNav {
    UIView *flipView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    
    UIButton *button1 = [[UIButton alloc] init];
    [button1 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [button1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    button1.tag = 1;
    [button1 sizeToFit];
    [flipView addSubview:button1];
    [button1 addTarget:self action:@selector(flipAction:) forControlEvents:UIControlEventTouchUpInside];

    
    UIButton *button2 = [[UIButton alloc] init];
    [button2 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [button2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    button2.tag = 2;
    [button2 sizeToFit];
    [flipView addSubview:button2];
    [button2 addTarget:self action:@selector(flipAction:) forControlEvents:UIControlEventTouchUpInside];
    button2.hidden = YES;
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:flipView];
    self.navigationItem.rightBarButtonItem = item;
    
    self.navigationController.navigationBar.translucent = YES;

}

- (void)flipAction:(UIButton *)btn {
    UIView *flipView = self.navigationItem.rightBarButtonItem.customView;
    
    UIButton *btn1 = (UIButton *)[flipView viewWithTag:1];
    UIButton *btn2 = (UIButton *)[flipView viewWithTag:2];
    
    BOOL isLeft = btn2.hidden;
    
    [self _flipView:flipView andIsLeft:isLeft];
    [self _flipView:self.view andIsLeft:isLeft];
    
    btn1.hidden = !btn1.hidden;
    btn2.hidden = !btn2.hidden;
    _posterView.hidden = !_posterView.hidden;
    _movieListTable.hidden = !_movieListTable.hidden;
    
}

- (void)_flipView:(UIView *)view andIsLeft:(BOOL)Left {
    UIViewAnimationOptions option = Left?UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight;
    [UIView transitionWithView:view duration:0.5 options:option animations:nil completion:nil];
}


#pragma mark - PostView
- (void)_creatPosterView {
    _posterView = [[PosterView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_posterView];
}

#pragma mark - TableView
- (void)_creatTableView {
//    _movieListTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kwidth, kheight-ktabBarheight-knavHeight)]; //如果这样设置，那么navBar和tabBar要设置为不透明
    _movieListTable = [[UITableView alloc] initWithFrame:self.view.bounds];
    _movieListTable.backgroundColor = [UIColor blackColor];

    _movieListTable.dataSource = self;
    _movieListTable.delegate = self;
    _movieListTable.hidden = YES;
    [self.view addSubview:_movieListTable];
    
    UINib *nib = [UINib nibWithNibName:@"MovieCell" bundle:[NSBundle mainBundle]];
    [_movieListTable registerNib:nib forCellReuseIdentifier:@"cell"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _movieModalArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)   indexPath {
    
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    MovieModal *modal = _movieModalArray[indexPath.row];
    cell.modal = modal;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
