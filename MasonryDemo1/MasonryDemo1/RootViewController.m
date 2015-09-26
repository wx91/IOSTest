//
//  RootViewController.m
//  MasonryDemo1
//
//  Created by wangx on 15/9/25.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "RootViewController.h"
#import "Masonry.h"
#define MAS_SHORTHAND

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *superview = self.view;
    
    UIView *view1 = [[UIView alloc] init];
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    view1.backgroundColor = [UIColor blueColor];
    [superview addSubview:view1];
    
    UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 10, 10);
//    [superview addConstraints:@[
//                                //view1 constraints
//                                [NSLayoutConstraint constraintWithItem:view1
//                                                             attribute:NSLayoutAttributeTop
//                                                             relatedBy:NSLayoutRelationEqual
//                                                                toItem:superview
//                                                             attribute:NSLayoutAttributeTop
//                                                            multiplier:1.0
//                                                              constant:padding.top],
//                                
//                                [NSLayoutConstraint constraintWithItem:view1
//                                                             attribute:NSLayoutAttributeLeft
//                                                             relatedBy:NSLayoutRelationEqual
//                                                                toItem:superview
//                                                             attribute:NSLayoutAttributeLeft
//                                                            multiplier:1.0
//                                                              constant:padding.left],
//                                
//                                [NSLayoutConstraint constraintWithItem:view1
//                                                             attribute:NSLayoutAttributeBottom
//                                                             relatedBy:NSLayoutRelationEqual
//                                                                toItem:superview
//                                                             attribute:NSLayoutAttributeBottom
//                                                            multiplier:1.0
//                                                              constant:-padding.bottom],
//                                
//                                [NSLayoutConstraint constraintWithItem:view1
//                                                             attribute:NSLayoutAttributeRight
//                                                             relatedBy:NSLayoutRelationEqual
//                                                                toItem:superview
//                                                             attribute:NSLayoutAttributeRight
//                                                            multiplier:1
//                                                              constant:-padding.right],
//                                
//                                ]];
    
//    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(superview.mas_top).with.offset(padding.top); //with is an optional semantic filler
//        make.left.equalTo(superview.mas_left).with.offset(padding.left);
//        make.bottom.equalTo(superview.mas_bottom).with.offset(-padding.bottom);
//        make.right.equalTo(superview.mas_right).with.offset(-padding.right);
//    }];
//    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(superview).width.insets(padding);
//    }];
    //1.初级 居中显示一个view
//    UIView *sv=[UIView new];
//    sv.backgroundColor=[UIColor blackColor];
//    [superview addSubview:sv];
//    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(superview);
//        make.size.mas_equalTo(CGSizeMake(300, 300));
//    }];
    
    //2.初级 让一个view略小于其superview（边距为10）
//    UIView *sv1=[UIView new];
//    sv1.backgroundColor=[UIColor redColor];
//    [sv addSubview:sv1];
//    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(sv).width.insets(UIEdgeInsetsMake(10, 10, 10, 10));
//        等价于
//        make.top.equalTo(sv).width.offset(10);
//        make.left.equalTo(sv).width.offset(10);
//        计算的是绝对的数值
//        make.bottom.equalTo(sv).width.offset(-10);
//        make.right.equalTo(sv).width.offset(-10);
//        也等价于
//        make.top.left.bottom.and.right.equalTo(sv).width.insets(UIEdgeInsetsMake(10, 10, 10, 10));
//    }];
    //3.初级 让两个导读为150的view垂直居中且等宽间隔排列 间隔为10（自动计算其宽度）
//    int padding1=10;
//    UIView *sv2=[[UIView alloc]init];
//    sv2.backgroundColor=[UIColor redColor];
//    [sv addSubview:sv2];
//    UIView *sv3=[[UIView alloc]init];
//    sv3.backgroundColor=[UIColor redColor];
//    [sv addSubview:sv3];
//
//    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(sv.mas_centerY);
//        make.left.equalTo(sv.mas_left).with.offset(padding1);
//        make.right.equalTo(sv3.mas_left).with.offset(-padding1);
//        make.height.mas_equalTo(@150);
//        make.width.equalTo(sv3);
//    }];
//    [sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(sv.mas_centerY);
//        make.left.equalTo(sv2.mas_right).with.offset(padding1);
//        make.right.equalTo(sv.mas_right).with.offset(-padding1);
//        make.height.mas_equalTo(@150);
//        make.width.equalTo(sv2);
//    }];
//    [中级] z在UIScrollView顺序排列一些view并自动计算contentsize
    UIScrollView *scrollView=[[UIScrollView alloc]init];
    scrollView.backgroundColor=[UIColor whiteColor];
    [superview addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(superview).width.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    
    UIView *container=[UIView new];
    [scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    int count=10;
    UIView *lastView=nil;
    for (int i=1; i<=count; i++) {
        UIView *subView=[UIView new];
        [container addSubview:subView];
        subView.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
                                               alpha:1];
        [subView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(container);
            make.height.mas_equalTo(@(20*i));
            if (lastView) {
                make.top.mas_equalTo(lastView.mas_bottom);
            }
            else
            {
                make.top.mas_equalTo(container.mas_top);
            }
        }];
        lastView=subView;
    }
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];
    //5.高级 横向或者纵向等间隙的排列一组view
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
