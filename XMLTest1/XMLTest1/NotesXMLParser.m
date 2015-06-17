//
//  UserXMLParser.m
//  XMLTest1
//
//  Created by wangx on 15/5/11.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "NotesXMLParser.h"

@implementation NotesXMLParser

-(void)start{
    NSString *path=[[NSBundle mainBundle]pathForResource:@"Notes" ofType:@"xml"];
    NSURL *url=[NSURL fileURLWithPath:path];
    //开始解析XML
    NSXMLParser *parser=[[NSXMLParser alloc]initWithContentsOfURL:url];
    parser.delegate=self;
    [parser parse];
}

//文档开始触发时，开始解析，只触发一次
-(void) parserDidStartDocument:(NSXMLParser *)parser{
    _notes=[[NSMutableArray alloc]init];
}
//文档解析出错
-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    NSLog(@"%@",parseError);
}
//遇到第一个标签开始触发
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    //把element赋值给成员变量currentTagName
    _currentTagName=elementName;
    if ([_currentTagName isEqualToString:@"Note"]) {
        NSString *_id=[attributeDict objectForKey:@"id"];
        NSMutableDictionary *dict=[NSMutableDictionary new];
        [dict setObject:_id forKey:@"id"];
        [_notes addObject:dict];
    }

}
//遇到字符串时触发
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    //替换回车符和空格
    string=[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([string isEqualToString:@""]) {
        return ;
    }
    NSMutableDictionary *dict=[_notes lastObject];
    if ([_currentTagName isEqualToString:@"CData"]&&dict) {
        [dict setObject:string forKey:@"CData"];
    }
    if ([_currentTagName isEqualToString:@"Content"]&&dict) {
        [dict setObject:string forKey:@"Content"];
    }
    if ([_currentTagName isEqualToString:@"UserID"]&&dict) {
        [dict setObject:string forKey:@"UserID"];
    }
}
//遇到结束标签时触发
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    self.currentTagName=nil;
}
//文档结束时触发
-(void)parserDidEndDocument:(NSXMLParser *)parser{
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"reloadViewNotificaiton" object:self.notes userInfo:nil];
    self.notes=nil;
}


@end
