//
//  CommentViewController.m
//  Movie
//
//  Created by 弄潮者 on 15/7/27.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "CommentViewController.h"
#import "DataService.h"
#import "CommentModal.h"
#import "Header.h"
#import "CommentCell.h"
#import "TopPsterModal.h"
#import "TopPosterView.h"
#import <MediaPlayer/MediaPlayer.h>

@interface CommentViewController ()
{
    NSMutableArray *_commentModalArray;
    UITableView *_commentTableView;
    
    TopPsterModal *_topPosterModal;
    TopPosterView *_posterView;
    
    NSInteger index[100];
}
@end

@implementation CommentViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil] ) {
        self.title = @"电影详情";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _creatTable];
    [self _creatHeaderView];

    [self _loadData];
    [self _leftLine];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playAction:) name:@"chuanzhi" object:nil];
    
    // Do any additional setup after loading the view.
}

- (void)playAction:(NSNotification *)text {
    NSLog(@"xxx");
    NSString *str = text.userInfo[@"returnInfo"];
    NSLog(@"%@",str);
    MPMoviePlayerViewController *ctrl = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:str]];
    [self presentMoviePlayerViewControllerAnimated:ctrl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -tableHeaderView
- (void)_creatHeaderView {
    _posterView = [[TopPosterView alloc] initWithFrame:CGRectMake(0, 0, 0, 250)];
    [_commentTableView setTableHeaderView:_posterView];
}

#pragma mark -Data
- (void)_loadData {
    NSDictionary *dataDic = [DataService getJsonDataFromFile:@"movie_comment.json"];
    NSLog(@"%@",dataDic);
    NSArray *dataArray = dataDic[@"list"];
    NSLog(@"%@",dataArray);
    _commentModalArray = [NSMutableArray array];
    
    for (NSDictionary *dic in dataArray) {
        CommentModal *modal = [[CommentModal alloc] init];
        [modal setValuesForKeysWithDictionary:dic];
//        NSLog(@"%@",modal);
        [_commentModalArray addObject:modal];
    }
    
    NSDictionary *topDataDic = [DataService getJsonDataFromFile:@"movie_detail.json"];
    _topPosterModal = [[TopPsterModal alloc] init];
    [_topPosterModal setValuesForKeysWithDictionary:topDataDic];
    NSLog(@"ttoooooo %@",_topPosterModal);
    
    
    _posterView.modal = _topPosterModal;
}

#pragma mark -tableView

- (void)_creatTable {
    _commentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kwidth, kheight-knavHeight)];
    _commentTableView.backgroundColor = [UIColor blackColor];
    
    _commentTableView.dataSource = self;
    _commentTableView.delegate = self;
    [self.view addSubview:_commentTableView];
    
//    UINib *nib = [UINib nibWithNibName:@"CommentCell" bundle:[NSBundle mainBundle]];
//    [_commentTableView registerNib:nib forCellReuseIdentifier:@"cell100"];

    [_commentTableView registerClass:[CommentCell class] forCellReuseIdentifier:@"cell100"];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _commentModalArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell100" forIndexPath:indexPath];
    CommentModal *modal = _commentModalArray[indexPath.row];
    cell.modal = modal;
    cell.tag = indexPath.row+100;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    CommentModal *modal = _commentModalArray[indexPath.row];
    CGSize contenSize = [modal.content boundingRectWithSize:CGSizeMake(kwidth-70 , 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    if (index[indexPath.row] == 0) {
        CommentCell *cell = (CommentCell *)[tableView viewWithTag:indexPath.row+100];
        cell.commentLabel.numberOfLines = 1;
        cell.commentLabel.frame = CGRectMake(75, 40, kwidth-80, 20);
        cell.imageViewBackGround.frame = CGRectMake(70, 5, kwidth-80, 65);
        return 75;
    }else {
        CommentCell *cell = (CommentCell *)[tableView viewWithTag:indexPath.row+100];
        cell.commentLabel.numberOfLines = 0;
        cell.commentLabel.frame = CGRectMake(75, 40, contenSize.width, contenSize.height);
        cell.imageViewBackGround.frame = CGRectMake(70, 5, kwidth-80, contenSize.height+45);

        return index[indexPath.row];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CommentCell *cell = (CommentCell *)[tableView viewWithTag:indexPath.row+100];
    cell.commentLabel.numberOfLines = 0;
    
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    CommentModal *modal = _commentModalArray[indexPath.row];
    CGSize contenSize = [modal.content boundingRectWithSize:CGSizeMake(kwidth-70 , 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    for (int i = 0; i < 100; i++) {
        index[i] = 0;
    }
    index[indexPath.row] = contenSize.height+60;
    [tableView reloadData];
}

#pragma mask -分割线左边15像素的问题
- (void)_leftLine {
    if ([_commentTableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [_commentTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_commentTableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [_commentTableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
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
