//
//  PhotoViewController.m
//  Movie
//
//  Created by 弄潮者 on 15/7/23.
//  Copyright (c) 2015年 弄潮者. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _creatNavcontroller];
    [self _creatCollection];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideNagationBar) name:@"hideNavgationBar" object:nil];
    
    // Do any additional setup after loading the view.
}

- (void)hideNagationBar {
    BOOL isHiden = self.navigationController.navigationBar.isHidden;
    [self.navigationController setNavigationBarHidden:!isHiden animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_creatNavcontroller {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(cancelButton:)];
    
}

- (void)cancelButton:(UIButton *)btn {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)_creatCollection {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = self.view.bounds.size;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    
    _collectionView = [[PhotoCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.imageUrlArray = _imageUrlArray;
    NSLog(@"%@",_imageUrlArray);
    [self.view addSubview:_collectionView];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_currentIndex inSection:0];
    NSLog(@"%@",indexPath);
    [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
}


- (void)setImageUrlArray:(NSArray *)imageUrlArray {
    _imageUrlArray = imageUrlArray;
//    NSLog(@"%@",imageUrlArray);
//    _collectionView.imageUrlArray = _imageUrlArray;
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
