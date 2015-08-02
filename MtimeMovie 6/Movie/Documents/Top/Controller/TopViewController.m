//
//  TopViewController.m
//  Movie
//
//  Created by 弄潮者 on 15/7/17.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "TopViewController.h"
#import "TopModal.h"
#import "TopCell.h"
#import "Header.h"
#import "DataService.h"
#import "CommentViewController.h"


@interface TopViewController ()
{
    UICollectionView *_collectionView;
    NSMutableArray *_topModalArray;
    
}
@end

@implementation TopViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"Top";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _loadData];
    [self _creatCollectionView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -Data
- (void)_loadData {
    NSDictionary *dataDic = [DataService getJsonDataFromFile:@"top250.json"];
    //    NSLog(@"%@",dataDic);
    
    _topModalArray = [NSMutableArray array];

    NSArray *subjects = dataDic[@"subjects"];
    for (NSDictionary *dic in subjects) {
        TopModal *modal = [[TopModal alloc] init];
        NSNumber *num = dic[@"rating"][@"average"];
        modal.average = [num floatValue];
        modal.images = dic[@"images"];
        modal.title = dic[@"title"];
//        NSLog(@"%@",modal);
        [_topModalArray addObject:modal];
    }
    

}

#pragma mark -collectionView
- (void)_creatCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.minimumInteritemSpacing = 10;
//    layout.minimumLineSpacing = 10;
    
    layout.itemSize = CGSizeMake((kwidth-40)/3, 200);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kwidth, kheight-knavHeight) collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    [self.view addSubview:_collectionView];
    
    UINib *nib = [UINib nibWithNibName:@"TopCell" bundle:[NSBundle mainBundle]];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:@"cell"];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _topModalArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    TopModal *modal = _topModalArray[indexPath.row];
    cell.modal = modal;
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    CommentViewController *vc =[[CommentViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
