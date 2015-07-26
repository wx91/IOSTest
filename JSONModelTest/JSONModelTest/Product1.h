//
//  Product1.h
//  JSONModelTest
//
//  Created by wangx on 15/7/26.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@interface Product1 : JSONModel
@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString<Optional>* name;
@property (assign, nonatomic) float price;
@property (strong, nonatomic) NSNumber<Optional>* uuid;
@end
