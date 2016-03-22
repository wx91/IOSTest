//
//  ViewController.m
//  ReactiveCocoaDemo2
//
//  Created by 王享 on 16/3/21.
//  Copyright © 2016年 王享. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveCocoa.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __block int num = 0;
//    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        num++;
//        NSLog(@"Increment num to :%i",num);
//        [subscriber sendNext:@(num)];
//        return nil;
//    }];
//        RACSignal *signal = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//            num++;
//            NSLog(@"Increment num to :%i",num);
//            [subscriber sendNext:@(num)];
//            return nil;
//        }] replay];
//    RACSignal *signal = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        num++;
//        NSLog(@"Increment num to :%i",num);
//        [subscriber sendNext:@(num)];
//        return nil;
//    }] replayLazily];
//    NSLog(@"Start subscriptions");
//    //Subscriber 1(S1)
//    [signal subscribeNext:^(id x) {
//        NSLog(@"S1 :%@",x);
//    }];
//    
//    //Subscriber 2(S2)
//    [signal subscribeNext:^(id x) {
//        NSLog(@"S2 :%@",x);
//    }];
//    //Subscriber 3(S3)
//    [signal subscribeNext:^(id x) {
//        NSLog(@"S3 :%@",x);
//    }];
    
    RACSubject *letters = [RACSubject subject];
    RACSignal *signal = letters;
//    RACSubject *letters = [RACSubject subject];
//    RACSignal *signal = [letters replayLast];
//    RACSubject *letters = [RACSubject subject];
//    RACSignal *signal = [letters replayLazily];
    NSLog(@"Subscribe S1");
    [signal subscribeNext:^(id x) {
        NSLog(@"S1 : %@",x);
    }];
    NSLog(@"Send A");
    [letters sendNext:@"A"];
    
    NSLog(@"Send B");
    [letters sendNext:@"B"];
    
    NSLog(@"Subscribe S2");
    [signal subscribeNext:^(id x) {
        NSLog(@"S2  : %@",x);
    }];
    
    NSLog(@"Send C");
    [letters sendNext:@"C"];
    
    NSLog(@"Send D");
    [letters sendNext:@"D"];
    
    NSLog(@"Subscribe S3");
    [signal subscribeNext:^(id x) {
        NSLog(@"S3 : %@",x);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
