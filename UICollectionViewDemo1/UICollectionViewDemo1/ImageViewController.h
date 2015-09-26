//
//  ImageViewController.h
//  UICollectionViewDemo
//
//  Created by wangx on 15/9/8.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UIViewController<UICollectionViewDataSource,
    UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UICollectionView *collectionView;


@end
