//
//  ImageCollectionViewCell.h
//  UICollectionViewDemo5
//
//  Created by 王享 on 16/3/11.
//  Copyright © 2016年 王享. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapButtonBlock)();

@interface ImageCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;

- (void)setTapButtonBlock:(TapButtonBlock) block;


@end
