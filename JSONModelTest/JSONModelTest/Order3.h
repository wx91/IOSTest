//
//  Order3.h
//  JSONModelTest
//
//  Created by wangx on 15/7/26.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@interface Order3 : JSONModel
@property (assign, nonatomic) int orderId;
@property (assign, nonatomic) float orderPrice;
@property (strong, nonatomic) NSString* orderProduct;

@end
