//
//  ImageCollectionViewCell.m
//  UICollectionViewDemo5
//
//  Created by 王享 on 16/3/11.
//  Copyright © 2016年 王享. All rights reserved.
//

#import "ImageCollectionViewCell.h"
@interface ImageCollectionViewCell ()

@property (nonatomic, strong) TapButtonBlock block;

@end

@implementation ImageCollectionViewCell


-(void)setTapButtonBlock:(TapButtonBlock)block{
    if (block) {
        _block=block;
    }
}

- (IBAction)tapCellButton:(id)sender {
    if (_block) {
        _block();
    }
}

@end
