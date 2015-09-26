//
//  MyCollectionViewCell.m
//  UICollectionViewDemo
//
//  Created by wangx on 15/9/8.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor purpleColor];
        
        self.imgView=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, CGRectGetWidth(frame)-10, CGRectGetWidth(frame)-10)];
        self.imgView.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [self addSubview:self.imgView];
        
        self.text=[[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.imgView.frame), CGRectGetWidth(self.frame)-10, 20)];
        self.text.backgroundColor=[UIColor brownColor];
        self.text.textAlignment=NSTextAlignmentCenter;
        [self addSubview:self.text];
        
        self.btn=[UIButton buttonWithType:UIButtonTypeCustom];
        self.btn.frame=CGRectMake(5, CGRectGetMaxY(self.text.frame), CGRectGetWidth(self.frame)-10, 30);
        [self.btn setTitle:@"按钮" forState:UIControlStateNormal];
        self.btn.backgroundColor=[UIColor orangeColor];
        [self addSubview:self.btn];
    }
    return self;
}

@end
