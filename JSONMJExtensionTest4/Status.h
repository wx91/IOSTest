//
//  Status.h
//  JSONTest4
//
//  Created by wangx on 15/5/15.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;

@interface Status : NSObject
//微博内容
@property(copy,nonatomic)NSString *text;
//微博作者 strong和copy的区别问题
@property(strong,nonatomic)User *user;
//转发微博
@property(strong,nonatomic) Status *retweetedStatus;


@end
