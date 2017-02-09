//
//  CaculatorMaker.h
//  ChainExample
//
//  Created by wangx on 2017/2/9.
//  Copyright © 2017年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CaculatorMaker : NSObject

@property (nonatomic , assign) int result;

-(CaculatorMaker *(^)(int)) add;

-(CaculatorMaker *(^)(int)) sub;

-(CaculatorMaker *(^)(int)) multi;

-(CaculatorMaker *(^)(int)) divide;


@end
