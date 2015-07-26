//
//  Order1.h
//  JSONModelTest
//
//  Created by wangx on 15/7/26.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import "JSONModel.h"
@interface Order1 : JSONModel
@property (assign, nonatomic) int order_id;
@property (assign, nonatomic) float total_price;
@property (strong, nonatomic) NSArray *products;

@end
