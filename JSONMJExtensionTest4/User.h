//
//  User.h
//  JSONTest4
//
//  Created by wangx on 15/5/15.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum{
    SexMale,
    SexFemale
} Sex;

@interface User : NSObject
//名称
@property(copy,nonatomic)NSString *name;
//头像
@property(copy,nonatomic)NSString *icon;
//年龄
@property(assign,nonatomic) NSUInteger age;
//身高
@property(copy,nonatomic)NSString *height;
//财富
@property(strong,nonatomic) NSNumber *money;
//性别
@property(assign,nonatomic)Sex sex;
//同性恋
@property(assign,nonatomic,getter=isGay)BOOL gay;

@end
