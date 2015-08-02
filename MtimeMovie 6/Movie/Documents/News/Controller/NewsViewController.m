//
//  NewsViewController.m
//  Movie
//
//  Created by 弄潮者 on 15/7/17.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "NewsViewController.h"
#import "Header.h"
#import "NewsModal.h"
#import "NewsCell.h"
#import "DataService.h"
#import "UIViewExt.h"
#import "UIImageView+WebCache.h"
#import "NewsImageViewController.h"
#import "NewsDetailViewController.h"

@interface NewsViewController ()
{
    NSMutableArray *_newsModalArray;
    UIImageView *_headerViewTop;
    UILabel *_headerLabel;
}
@end

@implementation NewsViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"新闻";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _creatTable];
    [self _creatHeaderView];
    [self _loadData];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -Data

- (void)_loadData {
    NSArray *dataArray = [DataService getJsonDataFromFile:@"news_list.json"];
//    NSLog(@"%@",dataArray);
    
    _newsModalArray = [NSMutableArray array];
    
    for (NSDictionary *dic in dataArray) {
        NewsModal *modal = [[NewsModal alloc] init];
        NSNumber *num = dic[@"type"];
        modal.newsType = [num intValue];
        
        modal.newsTitle = dic[@"title"];
        modal.newsSummary = dic[@"summary"];
        modal.newsImage = dic[@"image"];
//        NSLog(@"%@",modal);
        [_newsModalArray addObject:modal];
    }
    
    NewsModal *modal = _newsModalArray[0];
    _headerLabel.text = modal.newsTitle;
    [_headerViewTop sd_setImageWithURL:[NSURL URLWithString:modal.newsImage]];
    [_newsModalArray removeObjectAtIndex:0];
}

#pragma mark -tableHeaderView
- (void)_creatHeaderView {
    UIImageView *headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
    [_newsListTable setTableHeaderView:headerView];
    
    _headerViewTop = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kwidth, 200)];
    
    _headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kwidth, 30)];
    _headerLabel.textColor = [UIColor whiteColor];
    _headerLabel.backgroundColor = [UIColor blackColor];
    _headerLabel.alpha = 0.8;
    _headerLabel.font = [UIFont systemFontOfSize:18.0];
    _headerLabel.bottom = _headerViewTop.bottom;
    
    [self.view addSubview:_headerViewTop];
    [self.view addSubview:_headerLabel];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offY = scrollView.contentOffset.y;
//    NSLog(@"%f",offY);
    if (offY > 0) {//向上
        _headerViewTop.top = -offY;
        _headerLabel.bottom = _headerViewTop.bottom;
    }else { //向下
        CGFloat newHeight = ABS(offY)+200;
        CGFloat newWidth = newHeight/200*kwidth;
        _headerViewTop.frame = CGRectMake(-(newWidth-kwidth)/2, 0, newWidth, newHeight);
        _headerLabel.bottom = _headerViewTop.bottom;
    }
}

#pragma mark -tableView
- (void)_creatTable {
    _newsListTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kwidth, kheight-knavHeight)];
    _newsListTable.backgroundColor = [UIColor blackColor];          //这样拉倒底的时候背景不是白色的
//    _newsListTable = [[UITableView alloc] initWithFrame:self.view.bounds];
    
    _newsListTable.dataSource = self;
    _newsListTable.delegate = self;
    [self.view addSubview:_newsListTable];

    UINib *nib = [UINib nibWithNibName:@"NewsCell" bundle:[NSBundle mainBundle]];
    [_newsListTable registerNib:nib forCellReuseIdentifier:@"cell1"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _newsModalArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    NewsModal *modal = _newsModalArray[indexPath.row];
    cell.newsModal = modal;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"%ld",indexPath.row);
    NewsModal *modal = _newsModalArray[indexPath.row];
    if (modal.newsType == 0) {
        NewsDetailViewController *vc = [[NewsDetailViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        NewsImageViewController *vc = [[NewsImageViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }

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
