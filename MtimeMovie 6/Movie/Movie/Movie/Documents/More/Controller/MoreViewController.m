//
//  MoreViewController.m
//  Movie
//
//  Created by 弄潮者 on 15/7/17.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "MoreViewController.h"
#import "Header.h"
#import "MoreModal.h"
#import "MoreCell.h"
#import "UIImageView+WebCache.h"

@interface MoreViewController ()
{
    UITableView *_moreTableView;
    NSMutableArray *_moreModalArray;
    UIAlertView *_alert;
}
@end

@implementation MoreViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"更多";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _loadData];
    [self _creatTableView];
    [self setExtraCellLineHidden:_moreTableView];
    
    _alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确定清除所有缓存？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [self.view addSubview:_alert];
    
//    SDImageCache *cache = [[SDImageCache alloc] init];
//    NSLog(@"get size     %lu",[cache getSize]);

//    _alert
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [_moreTableView reloadData];
}

- (void)_loadData {
    NSArray *iconArray = @[@"moreClear",@"moreScore",@"moreVersion",@"moreBusiness",@"moreWelcome",@"moreAbout"];
    NSArray *titleArray = @[@"清除缓存",@"给个评价",@"检查新版本",@"商务合作",@"欢迎页",@"关于"];
    _moreModalArray = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        MoreModal *modal = [[MoreModal alloc] init];
        modal.iconImage = iconArray[i];
        modal.title = titleArray[i];
        NSLog(@"%@",modal);
        [_moreModalArray addObject:modal];
    }
    NSLog(@"%@",_moreModalArray);
}

- (void)_creatTableView {
//    self.view.backgroundColor = [UIColor blackColor];
    _moreTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kwidth, kheight-knavHeight) style:UITableViewStylePlain];
    
//    _moreTableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    _moreTableView.backgroundColor = [UIColor blackColor];
    
    _moreTableView.dataSource = self;
    _moreTableView.delegate = self;

    [self.view addSubview:_moreTableView];
    //去除多余的线的另一种方法
//    _moreTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    UINib *nib = [UINib nibWithNibName:@"MoreCell" bundle:[NSBundle mainBundle]];
    [_moreTableView registerNib:nib forCellReuseIdentifier:@"cell1"];
    
    [self _leftLine];
}

- (void)setExtraCellLineHidden: (UITableView *)tableView {
    [tableView setTableFooterView:[[UIView alloc] init]];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MoreCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
    cell.modal = _moreModalArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [_alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        SDImageCache *cache = [[SDImageCache alloc] init];
//        NSLog(@"~~~~~~get size     %lu",(unsigned long)[cache getSize]);
        [cache clearDisk];
        [_moreTableView reloadData];
    }
}

#pragma mask -分割线左边15像素的问题
- (void)_leftLine {
    if ([_moreTableView respondsToSelector:@selector(setSeparatorInset:)])
    {
        [_moreTableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_moreTableView respondsToSelector:@selector(setLayoutMargins:)])
    {
        [_moreTableView setLayoutMargins:UIEdgeInsetsZero];
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
