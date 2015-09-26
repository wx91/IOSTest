//
//  ViewController.m
//  MasonryDemo2
//
//  Created by wangx on 15/9/25.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@implementation ViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    [self initView];
}

-(void)initView{
    UIView *superview=self.view;
    self.titleLabel=[[UILabel alloc]init];
    self.titleLabel.textColor=[UIColor purpleColor];
    self.titleLabel.font=[UIFont systemFontOfSize:16];
    self.titleLabel.text=@"Hello world";
    self.titleLabel.backgroundColor=[UIColor lightGrayColor];
    [superview addSubview:self.titleLabel];
    
    self.contentLabel=[[UILabel alloc]init];
    self.contentLabel.textColor=[UIColor grayColor];
    self.contentLabel.backgroundColor=[UIColor redColor];
    self.contentLabel.font=[UIFont systemFontOfSize:13];
    self.contentLabel.text=@"This is forkingdog team. Here's our logo?\nGithub: \"forkingdog\"";
    [superview addSubview:self.contentLabel];
    
    //创建contentImageView
    self.contentImageView=[[UIImageView alloc]init];
    self.contentImageView.image=[UIImage imageNamed:@"breaddoge"];
    [superview addSubview:self.contentImageView];
    
    //创建usernameLabel
    self.usernameLabel=[[UILabel alloc]init];
    self.usernameLabel.textColor=[UIColor lightGrayColor];
    self.usernameLabel.text=@"sunnyxx";
    self.usernameLabel.backgroundColor=[UIColor purpleColor];
    [superview addSubview:self.usernameLabel];
    
    //创建timelabel
    self.timeLabel=[[UILabel alloc]init];
    self.timeLabel.font=[UIFont boldSystemFontOfSize:12];
    self.timeLabel.textColor=[UIColor greenColor];
    self.timeLabel.text=@"2015.04.10";
    self.timeLabel.backgroundColor=[UIColor redColor];
    [superview addSubview:self.timeLabel];
    
    
    //添加self.titleLabel的约束
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //设置titleLabel的左边与superview相差16
        make.left.equalTo(superview).with.offset(16);
        //设置titleLabel与有superview的右边相差10,由于使用绝对值 -10
        make.right.equalTo(superview).with.offset(-10);
        //设置titleLabel与superview的顶相差10
        make.top.equalTo(superview).with.offset(10);
        //设置titleLabel的底部比contentLabel的顶部高6
        make.bottom.equalTo(self.contentLabel.mas_top).with.offset(-6);
        //设置高度
    }];

    //添加contentLabel的约束
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //设置右边是superview的10
        make.left.equalTo(superview).with.offset(16);
        //设置左边与superview距离16
        make.right.equalTo(superview).with.offset(-10);
        //contentLabel的顶端比titleLabel的低端低6
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(6);
        //contentLabel的底端比contentImageView的顶部高8
        make.bottom.equalTo(self.contentImageView.mas_top).with.offset(-8);
    }];
    
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        //设置contentImageView的左边距离为16，设置左边对其titleLabel,contentLabel,usernameLabel
        make.left.equalTo(superview).with.offset(16);
        //设置contentImageView的右边距离superview大于16
        make.right.greaterThanOrEqualTo(superview).with.offset(16);
        //contentImageView的顶部距离contentLabel低8
        make.top.equalTo(self.contentLabel.mas_bottom).with.offset(8);
        //contentImageView的底部比username高8
        make.bottom.equalTo(self.usernameLabel.mas_top).with.offset(-8);
    }];
    //添加约束
    [self.usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //设置usernameLabel的左边距离为16 设置左边对齐titleLabel,contentLabel,contentImageView
        make.left.equalTo(superview).with.offset(16);
        //设置自usernameLabel的顶部在contentImageView底部的8
        make.top.equalTo(self.contentImageView.mas_bottom).with.offset(8);
        //设置usernameLabel的底部距离superview为4
        make.bottom.equalTo(superview).with.offset(-4);
        //设置usernameLabel的基准线和timelabel一致
        make.baseline.equalTo(self.timeLabel);
    }];
    
    //添加timeLabel的约束
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //timelabel的右边距离superview为10
        make.trailing.equalTo(superview).with.offset(-10);
        //设置timelabel的基准线和usernameLabel的一致
        make.baseline.equalTo(self.usernameLabel);
    }];

    
}


@end
