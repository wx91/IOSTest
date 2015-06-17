//
//  UserXMLParser.h
//  XMLTest1
//
//  Created by wangx on 15/5/11.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotesXMLParser : NSObject<NSXMLParserDelegate>
//解析出的数据，内部是字典类型
@property(strong,nonatomic)NSMutableArray *notes;
//当前标签的名字
@property(strong,nonatomic)NSString *currentTagName;
//开始解析
-(void)start;

@end
