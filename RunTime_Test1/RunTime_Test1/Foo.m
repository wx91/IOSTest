//
//  Foo.m
//  RunTime_Test1
//
//  Created by wangx on 15/9/7.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "Foo.h"
#include <objc/objc.h>
#include <objc/runtime.h>
#import "FooTest.h"

@implementation Foo

//+(BOOL)resolveInstanceMethod:(SEL)sel{
//    if (sel==@selector(foo)) {
//        IMP fooIMP=imp_implementationWithBlock(^(id _self){
//            NSLog(@"Doing instance foo");
//        });
//        class_addMethod([self class], @selector(foo), fooIMP, "v@:");
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}
////确实进入方法体内，但是打印不了，报错
//+(BOOL)resolveClassMethod:(SEL)sel{
//    if (sel==@selector(fooClass)) {
//        IMP fooClassIMP=imp_implementationWithBlock(^(id _self){
//            NSLog(@"Doing class foo");
//        });
//        class_addMethod([self class], @selector(fooClass), fooClassIMP, "v@:");
//        return YES;
//    }
//    return [super resolveClassMethod:sel];
//}

//-(id)forwardingTargetForSelector:(SEL)aSelector{
//    if (aSelector==@selector(foo)) {
//        FooTest *test=[[FooTest alloc]init];
////        return alternateObject;
//        return test;
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

-(NSMethodSignature *)methodSignatureForSelector{
    NSMethodSignature.
    return nil;
}
//-(void)forwardInvocation:(NSInvocation *)anInvocation{
//    SEL sel=anInvocation.selector;
//    FooTest *test=[[FooTest alloc]init];
//    if ([test respondsToSelector:sel]) {
//        [anInvocation invokeWithTarget:test];
//    }else{
//        [self doesNotRecognizeSelector:sel];
//    }
//}
@end
