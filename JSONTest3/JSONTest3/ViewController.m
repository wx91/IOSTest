//
//  ViewController.m
//  JSONTest3
//
//  Created by wangx on 15/5/12.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "ViewController.h"
#import "JSONKit.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (IBAction)parseJSONObj:(id)sender {
    NSString *path=[[NSBundle mainBundle]pathForResource:@"student" ofType:@"json"];
    NSData *data=[[NSData alloc]initWithContentsOfFile:path];
    NSString *jsonstr=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    self.showTextView.text=jsonstr;
    NSLog(@"%@",jsonstr);
    //NSDictionary *dic=[[JSONDecoder decoder]parseJSONData:data];
    NSDictionary *dic=[jsonstr objectFromJSONString];
    NSString *name=[dic objectForKey:@"username"];
    NSString *age=[dic objectForKey:@"age"];
    NSString *addres=[dic objectForKey:@"address"];
    NSLog(@"username=%@ age=%@ address=%@",name,age,addres);
    
}

- (IBAction)parseJSONAry:(id)sender {
    NSString *path=[[NSBundle mainBundle]pathForResource:@"students" ofType:@"json"];
    NSData *data=[[NSData alloc]initWithContentsOfFile:path];
    NSString *jsonstr=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    self.showTextView.text=jsonstr;
    NSLog(@"%@",jsonstr);
    NSArray *array=[jsonstr mutableObjectFromJSONString];
    for (int i=0; i<[array count]; i++) {
        NSDictionary *dic=[array objectAtIndex:i];
        NSString *name=[dic objectForKey:@"username"];
        NSString *age=[dic objectForKey:@"age"];
        NSString *addres=[dic objectForKey:@"address"];
        NSLog(@"username=%@ age=%@ address=%@\n",name,age,addres);
    }
    
}
- (IBAction)parseJSON:(id)sender {
    NSString *path=[[NSBundle mainBundle]pathForResource:@"notes" ofType:@"json"];
    NSData *data=[[NSData alloc]initWithContentsOfFile:path];
    NSString *jsonstr=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    self.showTextView.text=jsonstr;
    NSDictionary *dic=[jsonstr objectFromJSONString];
    NSString *school=[dic objectForKey:@"school"];
    NSString *address=[dic objectForKey:@"address"];
    NSArray *array=[dic objectForKey:@"users"];
    NSLog(@"school= %@,address=%@",school,address);
    for (int i=0; i<[array count]; i++) {
        NSDictionary *dic=[array objectAtIndex:i];
        NSString *name=[dic objectForKey:@"username"];
        NSString *age=[dic objectForKey:@"age"];
        NSString *addres=[dic objectForKey:@"address"];
        NSLog(@"username=%@ age=%@ address=%@\n",name,age,addres);
    }
}

- (IBAction)loadJSONObj:(id)sender {
    NSDictionary *dic=[[NSDictionary alloc]initWithObjectsAndKeys:@"chenjh",@"username",@"23",@"age",@"chengdu",@"address",nil];
    NSData *data=[dic JSONData];
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    self.showTextView.text=str;
    NSLog(@"%@",str);
    
}

- (IBAction)loadJSONAry:(id)sender {
    NSDictionary *dic=[[NSDictionary alloc]initWithObjectsAndKeys:@"chenjh",@"username",@"23",@"age",@"chengdu",@"address",nil];
    NSDictionary *dic1=[[NSDictionary alloc]initWithObjectsAndKeys:@"xuds",@"username",@"34",@"age",@"chengdu",@"address", nil];
    NSArray *array=[[NSArray alloc]initWithObjects:dic,dic1,nil];
    NSData *data=[array JSONData];
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    self.showTextView.text=str;
    NSLog(@"%@",str);
    
    
}

- (IBAction)loadJSON:(id)sender {
    NSDictionary *dic=[[NSDictionary alloc]initWithObjectsAndKeys:@"chenjh",@"username",@"23",@"age",@"chengdu",@"address",nil];
    NSDictionary *dic1=[[NSDictionary alloc]initWithObjectsAndKeys:@"xuds",@"username",@"34",@"age",@"chengdu",@"address", nil];
    NSArray *array=[[NSArray alloc]initWithObjects:dic,dic1,nil];
    NSDictionary *dic2=[[NSDictionary alloc]initWithObjectsAndKeys:array,@"users",nil];
    NSMutableDictionary *dic3=[[NSMutableDictionary alloc]initWithObjectsAndKeys:@"陈场中学",@"school","陈场镇",nil];
    [dic3 addEntriesFromDictionary:dic2];
    NSData *data=[dic3 JSONData];
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    self.showTextView.text=str;
    NSLog(@"%@",str);
    
}
@end
