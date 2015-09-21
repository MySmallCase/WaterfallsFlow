//
//  ViewController.m
//  WaterfallsFlow
//
//  Created by MyMac on 15/9/21.
//  Copyright © 2015年 MyMac. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

#import "NewedorsementModel.h"
#import "NewEdorsementLists.h"
#import "MJExtension.h"

static NSString *ID = @"cell";

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *figureShows;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
    
    [self getFigureShowView];
    
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.figureShows.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.lists = self.figureShows[indexPath.row];
    return cell;
    
}


#pragma mark - getter and setter
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 100) collectionViewLayout:flowLayout];
        
        [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:ID];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width * 0.5 - 16 , ([UIScreen mainScreen].bounds.size.width) * 0.5);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //top, left, bottom, right
    return UIEdgeInsetsMake(0, 8, 0, 8);
}

//每行之间的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

#pragma mark - getHttp
- (void)getFigureShowView{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"newedorsement" ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    NewedorsementModel *model = [NewedorsementModel objectWithKeyValues:data];
    if ([model.code isEqualToString:@"200"]) {
        _figureShows = [NewEdorsementLists objectArrayWithKeyValuesArray:model.data];
        
        [self.collectionView reloadData];
        self.collectionView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.collectionView.collectionViewLayout.collectionViewContentSize.height);
        
        NSLog(@"%f",self.collectionView.collectionViewLayout.collectionViewContentSize.height);
//
//        
////        NSLog(@"count===%d",self.figureShows.count);
        
    }else{
        NSLog(@"数据请求错误");
    }
    
}


@end
