//
//  JKCustomAlert.m
//  CustomAlertViewDemo
//
//  Created by wangx on 15/9/23.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import "JKCustomAlert.h"

@implementation JKCustomAlert

-(instancetype)initwithImage:(UIImage *)image contentImage:(UIImage *)content{
    if (self==[super init]) {
        self.backgroundImage=image;
        self.contentImage=content;
        self._buttonArrays=[NSMutableArray arrayWithCapacity:4];
    }
    return self;
}


@end
