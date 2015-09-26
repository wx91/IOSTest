//
//  AuthCodeViewController.m
//  AuthCodeDemo
//
//  Created by wangx on 15/9/17.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "AuthCodeViewController.h"
#define kScreenWidth [[UIScreen mainScreen]bounds].size.width

@implementation AuthCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *backView=[[UIView alloc]initWithFrame:CGRectMake(0, 50,kScreenWidth, 40)];
    [self.view addSubview:backView];
    //添加输入框
//    _input = [[UITextField alloc] initWithFrame:CGRectMake(30, 220, self.view.frame.size.width-60, 40)];
    _input=[[UITextField alloc]init];
    _input.frame=CGRectMake(20, 5, 150, 30);
    _input.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _input.font = [UIFont systemFontOfSize:14];
    _input.placeholder = @"请输入验证码";
    _input.clearButtonMode = UITextFieldViewModeWhileEditing;
    _input.borderStyle=UITextBorderStyleRoundedRect;
    _input.backgroundColor = [UIColor clearColor];
    _input.textAlignment = NSTextAlignmentLeft;
    _input.returnKeyType = UIReturnKeyDone;
    _input.delegate = self;
    [backView addSubview:_input];
    
    
    //显示验证码界面
//    authCodeView = [[AuthCodeView alloc] initWithFrame:CGRectMake(30, 100, self.view.frame.size.width-60, 40)];
    authCodeView=[[AuthCodeView alloc]init];
    authCodeView.frame=CGRectMake(180, 5, kScreenWidth-42-200, 30);
    [backView addSubview:authCodeView];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    //26*22
    button.frame=CGRectMake(kScreenWidth-42, 7, 26, 22);
    [button setImage:[UIImage imageNamed:@"Imported Layers Copy 30"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(refreshCode) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:button];
    
    
    //提示文字
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 160, self.view.frame.size.width-100, 40)];
//    label.text = @"点击图片换验证码";
//    label.font = [UIFont systemFontOfSize:12];
//    label.textColor = [UIColor grayColor];
//    [self.view addSubview:label];
    

}

-(void)refreshCode{
    if (authCodeView!=nil) {
        [authCodeView getAuthcode];
        [authCodeView setNeedsDisplay];
    }
}

#pragma mark 输入框代理，点击return 按钮
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    //判断输入的是否为验证图片中显示的验证码
    if ([_input.text isEqualToString:authCodeView.authCodeStr]){
        //正确弹出警告款提示正确
        UIAlertView *alview = [[UIAlertView alloc] initWithTitle:@"恭喜您" message:@"验证成功" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alview show];
    }else{
        //验证不匹配，验证码和输入框抖动
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
        anim.repeatCount = 1;
        anim.values = @[@-20,@20,@-20];
        //        [authCodeView.layer addAnimation:anim forKey:nil];
        [_input.layer addAnimation:anim forKey:nil];
    }
    
    return YES;
}

#pragma mark 警告框中方法
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //清空输入框内容，收回键盘
    if (buttonIndex==0){
        _input.text = @"";
        [_input resignFirstResponder];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
