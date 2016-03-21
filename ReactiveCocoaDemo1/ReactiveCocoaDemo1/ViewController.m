//
//  ViewController.m
//  ReactiveCocoaDemo1
//
//  Created by 王享 on 16/3/19.
//  Copyright © 2016年 王享. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveCocoa.h"
#import "RWDummySignInService.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIButton *signInButton;

@property (weak, nonatomic) IBOutlet UILabel *signInFailureText;

@property (strong, nonatomic) RWDummySignInService *signInService;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"登陆";
    
    self.signInService = [RWDummySignInService new];
    
    // initially hide the failure message
    self.signInFailureText.hidden = YES;
    
//    [[[self.usernameTextField.rac_textSignal
//       map:^id(NSString *text) {
//           return @(text.length);
//       }]
//      filter:^BOOL(NSNumber *length) {
//          return [length integerValue] > 3;
//      }]
//     subscribeNext:^(id x) {
//         NSLog(@"%@", x);
//     }];
    
    RACSignal *validUsernameSignal =
    [self.usernameTextField.rac_textSignal map:^id(NSString *text) {
        return @([self isValidUsername:text]);
    }];
    
    RACSignal *validPasswordSignal  =
    [self.passwordTextField.rac_textSignal
     map:^id(NSString *text) {
         return @([self isValidPassword:text]);
     }];
    RAC(self.passwordTextField,backgroundColor)=
    [validPasswordSignal map:^id(NSNumber *passwordValid) {
        return [passwordValid boolValue]?[UIColor clearColor]:[UIColor yellowColor];
    }];
    RAC(self.usernameTextField,backgroundColor)=
    [validUsernameSignal map:^id(NSNumber *usernameValid) {
       return [usernameValid boolValue]?[UIColor clearColor]:[UIColor yellowColor];
    }];
    
    RACSignal *signUpActiveSignal = [RACSignal combineLatest:@[validUsernameSignal,validPasswordSignal] reduce:^id(NSNumber *usernameValid,NSNumber *passwordValid){
        return @([usernameValid boolValue]&&[passwordValid boolValue]);
    }];
    [signUpActiveSignal subscribeNext:^(NSNumber *signupActive) {
        self.signInButton.enabled = [signupActive boolValue];
    }];
    
    [[[[self.signInButton rac_signalForControlEvents:UIControlEventTouchUpInside]
       doNext:^(id x) {
        self.signInButton.enabled = NO;
        self.signInFailureText.hidden=YES;
    }]
     flattenMap:^id(id value) {
         return [self signInSignal];
     }]subscribeNext:^(NSNumber *signedIn) {
         BOOL success = [signedIn boolValue];
         self.signInFailureText.hidden = success;
         if (success) {
             [self performSegueWithIdentifier:@"signInSuccess" sender:self];
         }
     }];
}
-(RACSignal *)signInSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self.signInService
         signInWithUsername:self.usernameTextField.text
         password:self.passwordTextField.text
         complete:^(BOOL success) {
             [subscriber sendNext:@(success)];
             [subscriber sendCompleted];
         }];
        return nil;
    }];
}

- (BOOL)isValidUsername:(NSString *)username {
    return username.length > 3;
}

- (BOOL)isValidPassword:(NSString *)password {
    return password.length > 3;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
