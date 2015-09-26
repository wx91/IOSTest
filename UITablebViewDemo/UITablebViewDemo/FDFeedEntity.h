//
//  FDFeedEntity.h
//  UITablebViewDemo
//
//  Created by wangx on 15/9/25.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FDFeedEntity : NSObject

@property(nonatomic,copy)NSString *identifier;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *username;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,copy)NSString *imageName;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;



@end
