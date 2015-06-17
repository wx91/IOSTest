//
//  ViewController.m
//  XMLTest1
//
//  Created by wangx on 15/5/11.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "ViewController.h"
#import "NotesXMLParser.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)loadXML:(id)sender {
    
}

- (IBAction)parseXML:(id)sender {
    NotesXMLParser *parser=[[NotesXMLParser alloc]init];
    [parser start];
}

@end
