//
//  Order3.m
//  JSONModelTest
//
//  Created by wangx on 15/7/26.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Order3.h"

@implementation Order3
+(JSONKeyMapper*)keyMapper
{
    return [JSONKeyMapper mapperFromUnderscoreCaseToCamelCase];
}
@end
