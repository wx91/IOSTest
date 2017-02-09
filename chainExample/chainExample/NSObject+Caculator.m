//
//  NSObject+Caculator.m
//  ChainExample1
//
//  Created by wangx on 2017/2/9.
//  Copyright © 2017年 wangx. All rights reserved.
//

#import "NSObject+Caculator.h"


@implementation NSObject (Caculator)

+ (int)makeCaculators:(void(^)(CaculatorMaker *maker))caculatorMaker
{
    CaculatorMaker *maker = [[CaculatorMaker alloc]init];
    caculatorMaker(maker);
    return maker.result;
}

@end
