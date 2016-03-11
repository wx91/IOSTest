//
//  CustomTransformCollecionLayout.h
//  UICollectionViewDemo5
//
//  Created by 王享 on 16/3/11.
//  Copyright © 2016年 王享. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

@class CustomTransformCollecionLayout;

@protocol CustomTransformCollecionLayoutDelegate <NSObject>

/**
 * 确定cell的大小
 */
- (CGSize) itemSizeWithCollectionView:(UICollectionView *)collectionView
                 collectionViewLayout:(CustomTransformCollecionLayout *)collectionViewLayout;

/**
 * 确定cell的大小
 */
- (CGFloat) marginSizeWithCollectionView:(UICollectionView *)collectionView
                    collectionViewLayout:(CustomTransformCollecionLayout *)collectionViewLayout;

@end

@interface CustomTransformCollecionLayout : UICollectionViewLayout

@property (nonatomic, weak) id<CustomTransformCollecionLayoutDelegate> layoutDelegate;


@end
