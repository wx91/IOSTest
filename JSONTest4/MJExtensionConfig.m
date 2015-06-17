//
//  MJExtensionConfig.m
//  JSONTest4
//
//  Created by wangx on 15/5/17.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//
#import "Bag.h"
#import "User.h"
#import "Student.h"
#import "StatusResult.h"
#import "MJExtension.h"
#import "MJExtensionConfig.h"

@implementation MJExtensionConfig
+(void)load{
    //User类只有name,icon属性参与字典转模型
//    [User setupAllowedCodingPropertyNames:^NSArray *{
//        return @[@"name",@"icon"];
//    }];
    //相当于User.m中实现了+allowedPropertyNames方法
    
    // Bag类中的name属性不参与归档
//    [Bag setupIgnoredCodingPropertyNames:^NSArray *{
//        return @[@"name"];
//    }];
    
    // Bag类中只有price属性参与归档
    //    [Bag setupAllowedCodingPropertyNames:^NSArray *{
    //        return @[@"price"];
    //    }];
    // 相当于在Bag.m中实现了+allowedCodingPropertyNames方法
    // StatusResult类中的statuses数组中存放的是Status模型
    // StatusResult类中的ads数组中存放的是Ad模型
    [StatusResult setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"statuses" : @"Status",
                 @"ads" : @"Ad"
                 };
    }];
    //相当于在StatusResult.m中实现了+objectClassInArray方法
    
    // Student中的ID属性对应着字典中的id
    // ....
    [Student setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID" : @"id",
                 @"desc" : @"desciption",
                 @"oldName" : @"name.oldName",
                 @"nowName" : @"name.newName",
                 @"nameChangedTime" : @"name.info.nameChangedTime",
                 @"bag" : @"other.bag"
                 };
    }];
    // 相当于在Student.m中实现了+replacedKeyFromPropertyName方法
    
}


@end
