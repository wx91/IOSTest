//
//  ViewController.h
//  SQLiteDemo1
//
//  Created by wangx on 15/5/6.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ViewController : UIViewController
- (IBAction)openDB:(id)sender;
- (IBAction)createTable:(id)sender;
- (IBAction)insertPerson:(id)sender;
- (IBAction)queryPerson:(id)sender;
- (IBAction)updatePerson:(id)sender;
- (IBAction)deletePerson:(id)sender;

@end

