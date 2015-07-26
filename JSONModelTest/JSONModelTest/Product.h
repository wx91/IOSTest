//
//  Country.h
//  JSONModelTest
//
//  Created by wangx on 15/7/25.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@interface Product : JSONModel
@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) float price;
@end
