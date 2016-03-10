//
//  CollectionViewCell.m
//  UICollectionViewDemo2
//
//  Created by 王享 on 16/3/10.
//  Copyright © 2016年 王享. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell




- (void) changeHighLightWithBool: (BOOL) highlight{
    
    NSString *imageName = @"003.jpg";
    
    if (highlight) {
        imageName = @"002.jpg";
    }
    
    [_highlightImage setImage: [UIImage imageNamed:imageName]];
}


@end
