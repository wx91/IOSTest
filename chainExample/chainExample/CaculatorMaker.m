//
//  CaculatorMaker.m
//  ChainExample
//
//  Created by wangx on 2017/2/9.
//  Copyright © 2017年 wangx. All rights reserved.
//

#import "CaculatorMaker.h"

@implementation CaculatorMaker

-(CaculatorMaker *(^)(int))add{
    return ^id(int x){
        self.result +=x;
        return self;
    };
}

-(CaculatorMaker *(^)(int))sub{
    return ^id(int x){
        self.result -=x;
        return self;
    };
}

-(CaculatorMaker *(^)(int))multi{
    return ^id(int x){
        self.result *=x;
        return self;
    };
}

-(CaculatorMaker *(^)(int))divide{
    return ^id(int x){
        self.result /=x;
        return self;
    };
}

@end
