//
//  ViewController.h
//  JSONTest2
//
//  Created by wangx on 15/5/12.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *showTextView;

- (IBAction)ParserJSONObj:(id)sender;

- (IBAction)ParserJSONAry:(id)sender;
- (IBAction)ParserJSON:(id)sender;


- (IBAction)loadJSONObj:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *loadJSONAry;

- (IBAction)loadJSONAry:(id)sender;


@end

