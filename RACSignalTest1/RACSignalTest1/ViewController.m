//
//  ViewController.m
//  RACSignalTest1
//
//  Created by 王享 on 16/3/20.
//  Copyright © 2016年 王享. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveCocoa.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        [subscriber sendNext:@1];
//        [subscriber sendNext:@2];
//        [subscriber sendNext:@3];
//        [subscriber sendCompleted];
//        return nil;
//    }];
//    NSLog(@"Sigal was created.");
//    [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
//       [signal subscribeNext:^(id x) {
//           NSLog(@"Subscriber 1 recveive:%@",x);
//       }];
//    }];
//    
//    [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
//        [signal subscribeNext:^(id x) {
//            NSLog(@"Subscriber 2 recveive:%@",x);
//        }];
//    }];
//    RACMulticastConnection *connection = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//       [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
//           [subscriber sendNext:@1];
//       }];
//        
//        [[RACScheduler mainThreadScheduler] afterDelay:2 schedule:^{
//            [subscriber sendNext:@2];
//        }];
//        [[RACScheduler mainThreadScheduler] afterDelay:3 schedule:^{
//            [subscriber sendNext:@3];
//        }];
//        [[RACScheduler mainThreadScheduler] afterDelay:4 schedule:^{
//            [subscriber sendCompleted];
//        }];
//        return nil;
//    }] publish];
//    [connection connect];
//    RACSignal *signal = connection.signal;
//    
//        NSLog(@"Sigal was created.");
//        [[RACScheduler mainThreadScheduler] afterDelay:1.1 schedule:^{
//           [signal subscribeNext:^(id x) {
//               NSLog(@"Subscriber 1 recveive:%@",x);
//           }];
//        }];
//    
//        [[RACScheduler mainThreadScheduler] afterDelay:2.1 schedule:^{
//            [signal subscribeNext:^(id x) {
//                NSLog(@"Subscriber 2 recveive:%@",x);
//            }];
//        }];
//    RACSubject *subject = [RACSubject subject];
//    RACSubject *replaySubject= [RACReplaySubject subject];
//    [[RACScheduler mainThreadScheduler] afterDelay:0.1 schedule:^{
//       //Subscriber 1
//        [subject subscribeNext:^(id x) {
//            NSLog(@"Subscriber 1 get a next value :%@ from subject",x);
//        }];
//        [replaySubject subscribeNext:^(id x) {
//            NSLog(@"Subscriber 1 get a next value :%@ from replay subject",x);
//        }];
//        
//        //Subscriber 2
//        [subject subscribeNext:^(id x) {
//            NSLog(@"Subscriber 2 get a next value :%@ from subject",x);
//        }];
//        [replaySubject subscribeNext:^(id x) {
//            NSLog(@"Subscriber 2 get a next value :%@ from replay subject",x);
//        }];
//    }];
//    
//    [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
//        [subject sendNext:@"send package 1"];
//        [replaySubject sendNext:@"send package 1"];
//    }];
//    
//    [[RACScheduler mainThreadScheduler] afterDelay:1.1 schedule:^{
//        //Subscriber 3
//        [subject subscribeNext:^(id x) {
//            NSLog(@"Subscriber 3 get a next value :%@ from subject",x);
//        }];
//        [replaySubject subscribeNext:^(id x) {
//            NSLog(@"Subscriber 3 get a next value :%@ from replay subject",x);
//        }];
//        
//        //Subscriber 4
//        [subject subscribeNext:^(id x) {
//            NSLog(@"Subscriber 4 get a next value :%@ from subject",x);
//        }];
//        [replaySubject subscribeNext:^(id x) {
//            NSLog(@"Subscriber 4 get a next value :%@ from replay subject",x);
//        }];
//    }];
//    [[RACScheduler mainThreadScheduler] afterDelay:2 schedule:^{
//        [subject sendNext:@"send package 2"];
//        [replaySubject sendNext:@"send package 2"];
//    }];
    
    RACSignal *coldSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"Cold signal be subscribed.");
        [[RACScheduler mainThreadScheduler] afterDelay:1.5 schedule:^{
            [subscriber sendNext:@"A"];
        }];
        
        [[RACScheduler mainThreadScheduler] afterDelay:3 schedule:^{
            [subscriber sendNext:@"B"];
        }];
        
        [[RACScheduler mainThreadScheduler] afterDelay:5 schedule:^{
            [subscriber sendCompleted];
        }];
        
        return nil;
    }];

    RACSubject *subject = [RACSubject subject];
    NSLog(@"Subject created.");
    
    [[RACScheduler mainThreadScheduler] afterDelay:2 schedule:^{
        [coldSignal subscribe:subject];
    }];
    
    [subject subscribeNext:^(id x) {
        NSLog(@"Subscriber 1 recieve value:%@.", x);
    }];
    
    [[RACScheduler mainThreadScheduler] afterDelay:4 schedule:^{
        [subject subscribeNext:^(id x) {
            NSLog(@"Subscriber 2 recieve value:%@.", x);
        }];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
