//
//  Order2.h
//  JSONModelTest
//
//  Created by wangx on 15/7/26.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@interface Order2 : JSONModel
@property (assign, nonatomic) int id;
@property (assign, nonatomic) float price;
@property (strong, nonatomic) NSString* productName;
@end
