//
//  ViewController.m
//  SQLiteDemo2
//
//  Created by wangx on 15/5/8.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "ViewController.h"
#import "FMDB.h"

#define DBNAME      @"personinfo.sqlite"
#define NAME        @"name"
#define AGE         @"age"
#define ADDRESS     @"address"
#define TABLENAME   @"person"
@implementation ViewController
FMDatabase *db;
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)openDB:(id)sender {
    NSString *dbpath=[NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@",DBNAME];
    db=[FMDatabase databaseWithPath:dbpath];
    if ([db open]) {
        NSLog(@"数据库打开成功");
    }else{
        NSLog(@"数据库打开失败");
    }
    
    
}

- (IBAction)createPS:(id)sender {
    NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS person (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, address TEXT)";
    NSLog(@"%@",sqlCreateTable);
    [db executeUpdate:sqlCreateTable];
}

- (IBAction)savePerson:(id)sender {
    [db beginTransaction];
    NSString *sql1 = [NSString stringWithFormat:
                      @"insert into %@ (%@, %@, %@) values ('%@', '%@', '%@' )",
                      TABLENAME, NAME, AGE, ADDRESS, @"zhangsan", @"23", @"xichengqu" ];
    
    NSString *sql2 = [NSString stringWithFormat:
                      @"INSERT INTO %@ (%@, %@, %@) VALUES ('%@', '%@', '%@')",
                      TABLENAME, NAME, AGE, ADDRESS, @"lisi", @"20", @"dongchengqu"];
    NSLog(@"%@",sql1);
    NSLog(@"%@",sql2);
    [db executeUpdate:sql1];
    [db executeUpdate:sql2];
    [db commit];
}

- (IBAction)queryPS:(id)sender {
    NSString *sqlQry=@"select * from person";
    FMResultSet *rs=[db executeQuery:sqlQry];
    while ([rs next]) {
        NSString *name=[rs stringForColumn:@"name"];
        int age=[rs intForColumn:@"age"];
        NSString *address=[rs stringForColumn:@"address"];
        NSLog(@"name=%@ age=%d address=%@",name,age,address);
    }
}

- (IBAction)updatePS:(id)sender {
    NSString *sql1 = [NSString stringWithFormat:@"update person set %@ = %@ ",AGE,@"45"];
    NSLog(@"%@",sql1);
    [db executeUpdate:sql1];
}

- (IBAction)deletePS:(id)sender {
    NSString *sql1 = [NSString stringWithFormat:@"delete from person where %@=%@",AGE,@"45"];
    NSLog(@"%@",sql1);
    [db executeUpdate:sql1];
}

@end
