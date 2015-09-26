//
//  ViewController.m
//  AlertView
//
//  Created by wangx on 15/9/24.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import "ViewController.h"
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define kScreenW [UIScreen mainScreen].bounds.size.width
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];

}
-(void)initView{
    UIView *backView=[[UIView alloc]initWithFrame:CGRectMake(20, 100, kScreenW-40, 200)];
    backView.layer.cornerRadius=5;
    backView.backgroundColor=[UIColor brownColor];
    CGFloat kScreenWidth=
    CGRectGetWidth(backView.frame);
    
    UIView *lineView1=[[UIView alloc]initWithFrame:CGRectMake(0,0,kScreenWidth, 40)];
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(20, 5, 120, 30)];
    label1.text=@"第一天 2015-6-11";
    label1.textAlignment=NSTextAlignmentRight;
    label1.font=[UIFont systemFontOfSize:12];
    [lineView1 addSubview:label1];
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth-70,5,50,30)];
    label2.font=[UIFont systemFontOfSize:12];
    label2.text=@"其他";
    [lineView1 addSubview:label2];
    [backView addSubview:lineView1];

    UIView *lineView2=[[UIView alloc]initWithFrame:CGRectMake(0,40, kScreenWidth, 40)];
    UILabel *label3=[[UILabel alloc]initWithFrame:CGRectMake(20, 5, 60, 30)];
    label3.font=[UIFont systemFontOfSize:12];
    label3.text=@"预算项简述";
    label3.textAlignment=NSTextAlignmentRight;
    [lineView2 addSubview:label3];
    
    UITextField *textField1=[[UITextField alloc]initWithFrame:CGRectMake(90,5, kScreenWidth-90-20, 30)];
    textField1.font=[UIFont systemFontOfSize:12];
    textField1.textAlignment=NSTextAlignmentLeft;
    textField1.borderStyle=UITextBorderStyleRoundedRect;
    [lineView2 addSubview:textField1];
    textField1.placeholder=@"八字以内";
    [backView addSubview:lineView2];
    
    UIView *lineView3=[[UIView alloc]initWithFrame:CGRectMake(0,80, kScreenWidth, 40)];
    UILabel *label4=[[UILabel alloc]initWithFrame:CGRectMake(20, 5, 60, 30)];
    label4.font=[UIFont systemFontOfSize:12];
    label4.text=@"备注";
    label4.textAlignment=NSTextAlignmentRight;
    [lineView3 addSubview:label4];
    
    UITextField *textField2=[[UITextField alloc]initWithFrame:CGRectMake(90,5, kScreenWidth-90-20, 30)];
    textField2.font=[UIFont systemFontOfSize:12];
    textField2.textAlignment=NSTextAlignmentLeft;
    textField2.borderStyle=UITextBorderStyleRoundedRect;
    textField2.placeholder=@"八字以内";
    [lineView3 addSubview:textField2];
    [backView addSubview:lineView3];
    
    UIView *lineView4=[[UIView alloc]initWithFrame:CGRectMake(0,120, kScreenWidth, 40)];
    UILabel *label5=[[UILabel alloc]initWithFrame:CGRectMake(20, 5, 60, 30)];
    label5.font=[UIFont systemFontOfSize:12];
    label5.text=@"预算金额";
    label5.textAlignment=NSTextAlignmentRight;
    [lineView4 addSubview:label5];
    
    UITextField *textField3=[[UITextField alloc]initWithFrame:CGRectMake(90,5, kScreenWidth-90-20-40, 30)];
    textField3.font=[UIFont systemFontOfSize:12];
    textField3.textAlignment=NSTextAlignmentLeft;
    textField3.borderStyle=UITextBorderStyleRoundedRect;
    [lineView4 addSubview:textField3];
    
    UILabel *label6=[[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth-60, 5,40, 30)];
    label6.text=@"元";
    label6.textAlignment=NSTextAlignmentCenter;
    label6.font=[UIFont systemFontOfSize:12];
    [lineView4 addSubview:label6];
    [backView addSubview:lineView4];
    
    UIView *lineView5=[[UIView alloc]initWithFrame:CGRectMake(0, 160, kScreenWidth, 40)];

    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 2)];
    view1.backgroundColor=[UIColor grayColor];
    [lineView5 addSubview:view1];
    UIButton *button1=[UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame=CGRectMake((kScreenWidth)/4-30, 5, 60, 30);
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 setTitle:@"取消" forState:UIControlStateNormal];
    [lineView5 addSubview:button1];
    
    UIView *divisionView=[[UIView alloc]initWithFrame:CGRectMake(kScreenWidth/2+1, 0, 2, 40)];
    divisionView.backgroundColor=[UIColor grayColor];
    [lineView5 addSubview:divisionView];
    
    UIButton *button2=[UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame=CGRectMake((kScreenWidth)/4*3-30, 5, 60, 30);
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 setTitle:@"提交" forState:UIControlStateNormal];
    [lineView5 addSubview:button2];
    [backView addSubview:lineView5];
    [self.view addSubview:backView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
