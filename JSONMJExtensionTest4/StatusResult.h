//
//  StatusResult.h
//  JSONTest4
//
//  Created by wangx on 15/5/16.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatusResult : NSObject
//存放着某一页的微博数据（里面全部是Status模型）
@property(strong,nonatomic)NSMutableArray *statuses;
//存放着一堆广告数据（里面全是Ad模型）
@property(strong,nonatomic)NSArray *ads;
//总数
@property(strong,nonatomic)NSNumber *totalNumber;
//上一页的游标
@property(assign,nonatomic) long long previousCursor;
//下一页的游标
@property(assign,nonatomic) long long nextCursor;

@end
