//
//  Order2.m
//  JSONModelTest
//
//  Created by wangx on 15/7/26.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Order2.h"
#import "JSONModel.h"

@implementation Order2

+(JSONKeyMapper *)keyMapper{
    NSDictionary *dic=@{
                        @"order_id":@"id",
                        @"order_details.name":@"productName",
                        @"order_details.price.usd":@"price"
                        };
    JSONKeyMapper *mapper=[[JSONKeyMapper alloc]initWithDictionary:dic];
    return mapper;
}
@end
