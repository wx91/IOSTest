//
//  Order.h
//  JSONModelTest
//
//  Created by wangx on 15/7/25.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Product.h"
#import "JSONModel.h"
@interface Order : JSONModel
@property (assign, nonatomic) int order_id;
@property (assign, nonatomic) float total_price;
@property (strong, nonatomic) Product* product;
@end
