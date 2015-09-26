//
//  ImageViewController.m
//  UICollectionViewDemo
//
//  Created by wangx on 15/9/8.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "ImageViewController.h"
#import "MyCollectionViewCell.h"
#define fDeviceWidth [[UIScreen mainScreen]bounds].size.width
#define fDeviceHeight [[UIScreen mainScreen]bounds].size.height

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
//    flowLayout.headerReferenceSize=CGSizeMake(320, 160);
    self.collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0,fDeviceWidth, fDeviceHeight) collectionViewLayout:flowLayout];
    //设置代理
    self.collectionView.delegate=self;
    self.collectionView.dataSource=self;
    [self.view addSubview:self.collectionView];
    //注册Cell和ResuableView（相关于头部）
    [self.collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
}
//定义展示UICollectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}
//定义展示的section的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//自定义cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier=@"cell";
    MyCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        NSLog(@"无法继续创建UICollectionViewCell时打印，自定义的Cell就不可能进来了!");
    }
    cell.imgView.image=[UIImage imageNamed:@""];
    cell.text.text=[NSString stringWithFormat:@"Cell:%ld",indexPath.row];
    return cell;
}
//头部显示的内容
//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    UICollectionReusableView *header=[collectionView dequeueReusableCellWithReuseIdentifier:@"ReusableView" forIndexPath:indexPath];
//    return header;
//}

#pragma mark UICollectionViewDelegateFlowLayout
//定义每一个UICollectionViewCell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //边距栈5*4=20个
    //照片为正方形,边长(fDeviceWidth-20)/2-5-5,所以总高(fDeviceWidth-20)/2-5-5 20+30+5 label的高度20 btn的高度是30
    return CGSizeMake((fDeviceWidth-20)/2,(fDeviceWidth-20)/2+50);
}
//定义每一个UICollectionView的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return  UIEdgeInsetsMake(5, 5, 5, 5);
}
//定义每一个UICollectionView的纵向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
#pragma mark UICollectionViewDelegate
//UICollectionView选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    MyCollectionViewCell *cell=(MyCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSLog(@"选中%ld",indexPath.row);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
