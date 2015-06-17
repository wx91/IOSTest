//
//  ViewController.h
//  JSONTest1
//
//  Created by wangx on 15/5/12.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *showTextView;

- (IBAction)parseJSONObj:(id)sender;
- (IBAction)parseJSONAry:(id)sender;
- (IBAction)parseJSON:(id)sender;
- (IBAction)loadJSONObj:(id)sender;
- (IBAction)loadJSONAry:(id)sender;
- (IBAction)loadJSON:(id)sender;

@end

