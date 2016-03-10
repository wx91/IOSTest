//
//  CollectionViewCell.h
//  UICollectionViewDemo2
//
//  Created by 王享 on 16/3/10.
//  Copyright © 2016年 王享. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *highlightImage;


@property (weak, nonatomic) IBOutlet UIButton *selectButton;


- (void) changeHighLightWithBool: (BOOL) highlight;


@end
