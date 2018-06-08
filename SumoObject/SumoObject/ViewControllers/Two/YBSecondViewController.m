//
//  YBSecondViewController.m
//  SumoObject
//
//  Created by yan on 2017/11/25.
//  Copyright © 2017年 疏陌. All rights reserved.
//

#import "YBSecondViewController.h"
#import "YBFirstViewController.h"
#import "TwoCollectionViewCell.h"
@interface YBSecondViewController ()<UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>{
    YBFirstViewController*first;
    
    UICollectionView * collecttionView;
    
    NSArray * dataSource;
}

@end

@implementation YBSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"123";
    dataSource = @[@"button",@"label",@"textField",@"view",@"imageView"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:[self collectView]];
}


-(UICollectionView *)collectView{
    //实例化网格视图的布局样式；
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.minimumLineSpacing = 0;
    
    //创建网格；
    collecttionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, KUI_YB_ScreenWidth, KUI_YB_ScreenHeight) collectionViewLayout:flowLayout];
    collecttionView.showsVerticalScrollIndicator = NO;
    
//    [collecttionView registerClass:[TwoCollectionViewCell ] forCellWithReuseIdentifier:@"indentifier"];
    
    [collecttionView registerNib:[UINib nibWithNibName:NSStringFromClass([TwoCollectionViewCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"indentifier"];

//
//    [collecttionView registerClass:[CataHeaderReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CataHeaderReusableView"];
    
    collecttionView.backgroundColor = [UIColor whiteColor];
    collecttionView.dataSource = self;
    collecttionView.delegate = self;
    
    return collecttionView;
}
                       
#pragma mark ---------- collectionView delegate ----------

//设置每组有多少个Item;
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return dataSource.count;
}

//设置共有多少组;
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
    
}

//创建item;
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"indentifier";
    TwoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
//    [cell.cellBtn setTitle:dataSource[indexPath.row] forState:0];
//    [cell.cellBtn setTitleColor:[UIColor blackColor] forState:0];
//    
    
    return cell;
}

//item的点击事件；
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

//item的尺寸；
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((collectionView.frame.size.width-20)/3, 100);
}
//item的边距；
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}

//设置行边距;
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

////设置头视图的高度；
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//
//    return CGSizeMake(0, 50*kHeightRate);
//}


////设置组头视图;
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    UICollectionReusableView *resableview = nil;
//    if (kind == UICollectionElementKindSectionHeader) {
//        static NSString *header = @"CataHeaderReusableView";
//        CataHeaderReusableView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:header forIndexPath:indexPath];
//        [headerView setHeader:[_collectArray[indexPath.section] objectForKey:@"categoryTagName"]];
//        resableview = headerView;
//    }
//
//    return resableview;
//}

                       
                       
@end
