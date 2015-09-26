//
//  UIView+Masonry_LJC.m
//  MasonryDemo1
//
//  Created by wangx on 15/9/25.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "UIView+Masonry_LJC.h"
#import "Masonry.h"
#define MAS_SHORTHAND

@implementation UIView (Masonry_LJC)

- (void) distributeSpacingHorizontallyWith:(NSArray*)views
{
    NSMutableArray *spaces=[NSMutableArray arrayWithCapacity:views.count+1];
    for (int i=0; i<views.count+1; i++) {
        UIView *v=[UIView new];
        [spaces addObject:v];
        [self addSubview:v];
        
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(v.mas_height);
        }];
        
    }
}
@end
