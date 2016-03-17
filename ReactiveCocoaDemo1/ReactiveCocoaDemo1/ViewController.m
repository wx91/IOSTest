//
//  ViewController.m
//  ReactiveCocoaDemo1
//
//  Created by 王享 on 16/3/16.
//  Copyright © 2016年 王享. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveCocoa.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSArray *array = @[@1,@2,@3];
//    RACSequence *steam = [array rac_sequence];
//    [steam map:^id(id value) {
//        return @(pow([value integerValue], 2));
//    }];
//    NSLog(@"%@",[steam array]);
//    NSLog(@"%@",[[[array rac_sequence]map:^id(id value) {
//        return @(pow([value integerValue], 2));
//    }] array]);
//    
//    NSLog(@"%@",[[[array rac_sequence]filter:^BOOL(id value) {
//        return [value integerValue]%2==0;
//    }] array]);
//    NSLog(@"%@",[[[array rac_sequence]map:^id(id value) {
//        return [value stringValue];
//    }] foldLeftWithStart:@"" reduce:^id(id accumulator, id value) {
//        return [accumulator stringByAppendingString:value];
//    }]);
//    [self.textField.rac_textSignal subscribeNext:^(id x) {
//        NSLog(@"New Value : %@",x);
//    } error:^(NSError *error) {
//        NSLog(@"@Error : %@",error);
//    }completed:^{
//        NSLog(@"Completed.");
//    } ];
    RACSignal *validEmailSignal = [self.textField.rac_textSignal map:^id(NSString *value) {
        return @([value rangeOfString:@"@"].location != NSNotFound);
    }];
    
//    RAC(self.button ,enabled)=validEmailSignal;
//    
//    RAC(self.textField,textColor)=[validEmailSignal map:^id(id value) {
//        if ([value boolValue]) {
//            return [UIColor greenColor];
//        }else{
//            return [UIColor blueColor];
//        }
//    }];
    self.button.rac_command=[[RACCommand alloc]initWithEnabled:validEmailSignal signalBlock:^RACSignal *(id input) {
        NSLog(@"Button was pressed.");
        return [RACSignal empty];
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
