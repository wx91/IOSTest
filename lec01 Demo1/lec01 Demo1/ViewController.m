//
//  ViewController.m
//  lec01 Demo1
//
//  Created by wangx on 15/9/24.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 30, 30)];
    view.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:view];
    view.translatesAutoresizingMaskIntoConstraints=NO;
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view(==80)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
