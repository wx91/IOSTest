//
//  ViewController.m
//  ReactiveCocoaDemo1
//
//  Created by 王享 on 16/3/19.
//  Copyright © 2016年 王享. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveCocoa.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIButton *signInButton;


@property (weak, nonatomic) IBOutlet UILabel *signInFailureText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"登陆";
    //    等价于
    //    RACSignal *usernaeSourceSigal = self.usernameTextField.rac_textSignal;
    //    RACSignal *filteredUsername = [usernaeSourceSigal
    //                                   filter:^BOOL(id value) {
    //                                       NSString *text = value;
    //                                       return text.length > 3;
    //                                   }];
    //    [filteredUsername subscribeNext:^(id x) {
    //        NSLog(@"%@",x);
    //    }];
    
//    [[self.usernameTextField.rac_textSignal
//      filter:^BOOL(NSString *text) {
//          return text.length>3;
//      }]
//     subscribeNext:^(id x) {//NSString
//         NSLog(@"%@",x);
//     }];
//        [[[self.usernameTextField.rac_textSignal
//           map:^id(NSString *text) {
//               return @(text.length);
//        }]
//          filter:^BOOL(NSNumber *length) {
//              return [length integerValue]>3;
//          }]
//         subscribeNext:^(id x) {//NSNumber
//             NSLog(@"%@",x);
//         }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
