//
//  AuthCodeView.h
//  AuthCodeDemo
//
//  Created by wangx on 15/9/17.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AuthCodeView : UIView

@property (strong, nonatomic) NSArray *dataArray;//字符素材数组

@property (strong, nonatomic) NSMutableString *authCodeStr;//验证码字符串

- (void)getAuthcode;

@end
