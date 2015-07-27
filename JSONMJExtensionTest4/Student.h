//
//  Student.h
//  JSONTest4
//
//  Created by wangx on 15/5/16.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Bag;

@interface Student : NSObject
@property (copy, nonatomic) NSString *ID;
@property (copy, nonatomic) NSString *nowName;
@property (copy, nonatomic) NSString *oldName;
@property (copy, nonatomic) NSString *nameChangedTime;
@property (copy, nonatomic) NSString *desc;
@property (strong, nonatomic) Bag *bag;
@end
