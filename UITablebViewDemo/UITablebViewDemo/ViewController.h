//
//  ViewController.h
//  UITablebViewDemo
//
//  Created by wangx on 15/9/25.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController

@property (nonatomic, copy) NSArray *prototypeEntitiesFromJSON;

@property (nonatomic, strong) NSMutableArray *feedEntitySections; // 2d array

@end
