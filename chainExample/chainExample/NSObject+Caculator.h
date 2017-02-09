//
//  NSObject+Caculator.h
//  ChainExample1
//
//  Created by wangx on 2017/2/9.
//  Copyright © 2017年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CaculatorMaker.h"

@interface NSObject (Caculator)

+ (int)makeCaculators:(void(^)(CaculatorMaker *maker))caculatorMaker;

@end
