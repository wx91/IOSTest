//
//  ViewController.m
//  ChainExample
//
//  Created by wangx on 2017/2/9.
//  Copyright © 2017年 wangx. All rights reserved.
//

#import "ViewController.h"
#import "CaculatorMaker.h"
#import "NSObject+Caculator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int result = [NSObject makeCaculators:^(CaculatorMaker *maker) {
        maker.add(1).add(1).add(3).multi(3).sub(5).divide(2);
    }];
    NSLog(@"%d",result);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
