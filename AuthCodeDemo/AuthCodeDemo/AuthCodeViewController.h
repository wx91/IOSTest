//
//  AuthCodeViewController.h
//  AuthCodeDemo
//
//  Created by wangx on 15/9/17.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AuthCodeView.h"
@interface AuthCodeViewController : UIViewController<UITextFieldDelegate, UIAlertViewDelegate>{
    AuthCodeView *authCodeView;
    UITextField *_input;
}


@end
