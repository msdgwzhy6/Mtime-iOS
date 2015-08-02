//
//  CinemaViewController.m
//  Movie
//
//  Created by 弄潮者 on 15/7/17.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "CinemaViewController.h"
#import "Header.h"
#import "DataService.h"
#import "CinemaModal.h"
#import "DistrictModal.h"
#import "CinemaCell.h"

@interface CinemaViewController ()
{
    UITableView *_cinemaListTable;
    NSMutableArray *_cinemaModalArray;
    NSMutableArray *_districtModalArray;
    BOOL flag[100];
}
@end

@implementation CinemaViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"影院";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _loadData];
    [self _creatTableView];
    
    [self _leftLine];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_loadData {
    NSDictionary *dataDic = [DataService getJsonDataFromFile:@"cinema_list.json"];
    
    NSArray *cinemaList = dataDic[@"cinemaList"];
    _cinemaModalArray = [NSMutableArray array];
//    NSLog(@"%li",cinemaList.count);
    for (NSDictionary *dic in cinemaList) {
        CinemaModal *modal = [[CinemaModal alloc] init];
        [modal setValuesForKeysWithDictionary:dic];
        [_cinemaModalArray addObject:modal];
//        NSLog(@"%@",modal);
    }
    
    NSDictionary *districtDic = [DataService getJsonDataFromFile:@"district_list.json"];
    _districtModalArray = [NSMutableArray array];
    NSArray *districtArray = districtDic[@"districtList"];
    for (NSDictionary *dic in districtArray) {
        DistrictModal *disModal = [[DistrictModal alloc] init];
        disModal.cinemaListArray = [NSMutableArray array];
        disModal.disId = [dic[@"id"] integerValue];
        disModal.name = dic[@"name"];
        for (CinemaModal *cinemaModal in _cinemaModalArray) {
            NSInteger ditID = [cinemaModal.districtId integerValue];
            if (ditID == disModal.disId) {
                [disModal.cinemaListArray addObject:cinemaModal];
            }
        }
        //        NSLog(@"%@",disModal.name);
        [_districtModalArray addObject:disModal];
    }
    
}

- (void)_creatTableView {
    _cinemaListTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kwidth, kheight-knavHeight) style:UITableViewStylePlain];
    
    _cinemaListTable.backgroundColor = [UIColor blackColor];
    _cinemaListTable.dataSource = self;
    _cinemaListTable.delegate = self;
    [self.view addSubview:_cinemaListTable];
    
    UINib *nib = [UINib nibWithNibName:@"CinemaCell" bundle:[NSBundle mainBundle]];
    [_cinemaListTable registerNib:nib forCellReuseIdentifier:@"cell"];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    NSLog(@"%lu",_districtModalArray.count);
    return _districtModalArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    DistrictModal *modal = _districtModalArray[section];
    NSArray *cinemArray = modal.cinemaListArray;
    if (flag[section] == NO) {
        return 0;
    }
    return cinemArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DistrictModal *modal = _districtModalArray[indexPath.section];
    NSArray *cinemaArray = modal.cinemaListArray;
    
    CinemaCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.modal = cinemaArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    DistrictModal *modal = _districtModalArray[section];
    NSString *groupName = modal.name;
    NSLog(@"%@",groupName);
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:@"hotMovieBottomImage"] forState:UIControlStateNormal];
    [button setTitle:groupName forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    button.titleLabel.font = [UIFont systemFontOfSize:20];
    [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = section;
    return button;
}

- (void)btnAction:(UIButton *)btn {
//    NSLog(@"%li按钮按下",btn.tag);
    flag[btn.tag] = !flag[btn.tag];
    
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:btn.tag];
    [_cinemaListTable reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mask -分割线左边15像素的问题
- (void)_leftLine {
    if ([_cinemaListTable respondsToSelector:@selector(setSeparatorInset:)])
    {
        [_cinemaListTable setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([_cinemaListTable respondsToSelector:@selector(setLayoutMargins:)])
    {
        [_cinemaListTable setLayoutMargins:UIEdgeInsetsZero];
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
