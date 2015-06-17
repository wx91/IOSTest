//
//  ViewController.m
//  JSONTest2
//
//  Created by wangx on 15/5/12.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "ViewController.h"
#import "CJSONDeserializer.h"
#import "CJSONSerializer.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)ParserJSONObj:(id)sender {
    NSString *path=[[NSBundle mainBundle]pathForResource:@"student" ofType:@"json"];
    NSData *data=[[NSData alloc]initWithContentsOfFile:path];
    NSString *jsonstr=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    self.showTextView.text=jsonstr;
    NSLog(@"%@",jsonstr);
    NSError *error;
    NSDictionary *dic=[[CJSONDeserializer deserializer]deserialize:[jsonstr dataUsingEncoding:NSUTF8StringEncoding] error:&error
     ];
    NSString *name=[dic objectForKey:@"username"];
    NSString *age=[dic objectForKey:@"age"];
    NSString *addres=[dic objectForKey:@"address"];
    NSLog(@"username=%@ age=%@ address=%@",name,age,addres);
}

- (IBAction)ParserJSONAry:(id)sender {
    NSString *path=[[NSBundle mainBundle]pathForResource:@"students" ofType:@"json"];
    NSData *data=[[NSData alloc]initWithContentsOfFile:path];
    NSString *jsonstr=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    self.showTextView.text=jsonstr;
    NSLog(@"%@",jsonstr);
    NSError *error;
    NSArray *array=[[CJSONDeserializer deserializer]deserialize:[jsonstr dataUsingEncoding:NSUTF8StringEncoding] error:&error
                       ];
    for (int i=0; i<[array count]; i++) {
        NSDictionary *dic=[array objectAtIndex:i];
        NSString *name=[dic objectForKey:@"username"];
        NSString *age=[dic objectForKey:@"age"];
        NSString *addres=[dic objectForKey:@"address"];
        NSLog(@"username=%@ age=%@ address=%@\n",name,age,addres);
    }
}

- (IBAction)ParserJSON:(id)sender {
    NSString *path=[[NSBundle mainBundle]pathForResource:@"notes" ofType:@"json"];
    NSData *data=[[NSData alloc]initWithContentsOfFile:path];
    NSString *jsonstr=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    self.showTextView.text=jsonstr;
    NSError *error;
    NSDictionary *dic=[[CJSONDeserializer deserializer]deserializeAsDictionary:data error:&error];
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
    NSError *error;
    CJSONSerializer *serializer=[CJSONSerializer serializer];
    NSData *data=[serializer serializeDictionary:dic error:&error];
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    self.showTextView.text=str;
    NSLog(@"%@",str);
}
- (IBAction)loadJSONAry:(id)sender {
    NSDictionary *dic=[[NSDictionary alloc]initWithObjectsAndKeys:@"chenjh",@"username",@"23",@"age",@"chengdu",@"address",nil];
    NSDictionary *dic1=[[NSDictionary alloc]initWithObjectsAndKeys:@"xuds",@"username",@"34",@"age",@"chengdu",@"address", nil];
    NSArray *array=[[NSArray alloc]initWithObjects:dic,dic1,nil];
    NSError *error;
    CJSONSerializer *serializer=[CJSONSerializer serializer];
    NSData *data=[serializer serializeArray:array error:&error];
    NSString *str=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    self.showTextView.text=str;
    NSLog(@"%@",str);
    
}
@end
