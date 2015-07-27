//
//  ViewController.h
//  XMLTest1
//
//  Created by wangx on 15/5/11.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSXMLParserDelegate>

@property(strong,nonatomic)NSMutableArray *notes;

@property(strong,nonatomic)NSString *tag;

@property (weak, nonatomic) IBOutlet UITextView *showTextView;

- (IBAction)loadXML:(id)sender;

- (IBAction)parseXML:(id)sender;

@end

