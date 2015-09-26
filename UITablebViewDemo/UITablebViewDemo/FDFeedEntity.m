//
//  FDFeedEntity.m
//  UITablebViewDemo
//
//  Created by wangx on 15/9/25.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "FDFeedEntity.h"

@implementation FDFeedEntity
-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self=[self init];
    if (self) {
        _identifier=[self uniqueIdentifier];
        _title=dictionary[@"title"];
        _content=dictionary[@"content"];
        _username=dictionary[@"username"];
        _time=dictionary[@"time"];
        _imageName=dictionary[@"imageName"];
    }
    return self;
}
-(NSString *)uniqueIdentifier{
    static NSInteger counter=0;
    NSString *result=[NSString stringWithFormat:@"unique-id-%@", @(counter++)];
    return result;
}

@end
