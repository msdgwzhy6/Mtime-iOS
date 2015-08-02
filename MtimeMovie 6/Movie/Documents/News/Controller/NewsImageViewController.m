//
//  NewsDetailViewController.m
//  Movie
//
//  Created by 弄潮者 on 15/7/22.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "NewsImageViewController.h"
#import "UIImageView+WebCache.h"
#import "DataService.h"
#import "NewsImageModal.h"
#import "NewsImageCell.h"
#import "Header.h"
#import "BaseNavViewController.h"
#import "PhotoViewController.h"

@interface NewsImageViewController ()
{
    NSMutableArray *_newsImagesModalArray;
    UICollectionView *_collectionView;
    
}
@end



@implementation NewsImageViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = @"图片新闻";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];

    [self _loadData];
    [self _creatCollectionView];
}

- (void)_loadData {
    NSArray *array = [DataService getJsonDataFromFile:@"image_list.json"];
    _newsImagesModalArray = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        NewsImageModal *modal = [[NewsImageModal alloc] init];
        
        //可以直接赋值，但是modal的名字要跟json里面的名字相同，且json里面有些不赋值的，要在modal.m里面处理
        [modal setValuesForKeysWithDictionary:dic];
//        NSLog(@"%@",modal);
        [_newsImagesModalArray addObject:modal];
    }
}

#pragma mark -collectionView
- (void)_creatCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = CGSizeMake((kwidth-50)/4, (kwidth-50)/4);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kwidth, kheight-knavHeight) collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    [self.view addSubview:_collectionView];
    
    [_collectionView registerClass:[NewsImageCell class] forCellWithReuseIdentifier:@"cell"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _newsImagesModalArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NewsImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NewsImageModal *modal = _newsImagesModalArray[indexPath.row];
    cell.modal = modal;
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoViewController *vc = [[PhotoViewController alloc] init];//这只是一个申请内存的动作,不会执行PhotoViewController.m中的viewDidLoad方法，而是到下面设置backgroundColor才执行viewDidLoad方法
//    NSLog(@"%li",indexPath.row);
    vc.currentIndex = indexPath.row;
    
//    NSLog(@"%li",vc.currentIndex);
    
    NSMutableArray *imageUrlArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < _newsImagesModalArray.count; i++) {
        NewsImageModal *modal = _newsImagesModalArray[i];
        [imageUrlArray addObject:modal.image];
    }
    /**
     *  下面两句话的顺序要弄清楚！！！还没执行PhotoViewController.m中的viewDidLoad方法，collectionView还没有创建。
     如果顺序犯下，background先的话，那么就先创建collectionView，但是此时imageUrlArray还没赋值为nil，    _collectionView.imageUrlArray = _imageUrlArray;执行无效，仍为nil。
     再去调用vc.imageUrlArray = imageUrlArray;这句话并不会改变_collectionView.imageUrlArray的内容，因为并没有执行什么操作让

     */
    vc.imageUrlArray = imageUrlArray;

    vc.view.backgroundColor =  [UIColor greenColor];

    
    BaseNavViewController *nav = [[BaseNavViewController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}


@end
