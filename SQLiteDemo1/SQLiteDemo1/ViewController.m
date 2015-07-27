//
//  ViewController.m
//  SQLiteDemo1
//
//  Created by wangx on 15/5/6.
//  Copyright (c) 2015年 wxiang1991. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
#define DBNAME      @"personinfo.sqlite"
#define NAME        @"name"
#define AGE         @"age"
#define ADDRESS     @"address"
#define TABLENAME   @"person"
static sqlite3 *db;
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void) execSql:(NSString *)sql{
    char *err;
    int result=sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err);
    if (result!=SQLITE_OK ){
        sqlite3_close(db);
        NSLog(@"数据库操作失败！");
        
    }
}

- (IBAction)openDB:(id)sender{
    NSString *databasePath=[NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@",DBNAME];
    NSFileManager *filemanager=[NSFileManager defaultManager];
    if ([filemanager fileExistsAtPath:databasePath]==NO) {
        const char *dbpath=[databasePath UTF8String];
        int result=sqlite3_open(dbpath, &db);
        if (result==SQLITE_OK) {
            NSLog(@"打开数据库成功！");
        }else{
            NSLog(@"打开数据库失败");
        }
    }
}

- (IBAction)createTable:(id)sender{
    NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS person (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, address TEXT)";
    NSLog(@"%@",sqlCreateTable);
    [self execSql:sqlCreateTable];
}

- (IBAction)insertPerson:(id)sender{
    NSString *sql1 = [NSString stringWithFormat:
                      @"insert into %@ (%@, %@, %@) values ('%@', '%@', '%@' )",
                      TABLENAME, NAME, AGE, ADDRESS, @"zhangsan", @"23", @"xichengqu" ];
    
    NSString *sql2 = [NSString stringWithFormat:
                      @"INSERT INTO %@ (%@, %@, %@) VALUES ('%@', '%@', '%@')",
                      TABLENAME, NAME, AGE, ADDRESS, @"lisi", @"20", @"dongchengqu"];
    NSLog(@"%@",sql1);
    NSLog(@"%@",sql2);
    [self execSql:sql1];
    [self execSql:sql2];
}
- (IBAction)queryPerson:(id)sender{
    NSString *sqlQry=@"select * from person";
    sqlite3_stmt *stmt;
    
    if (sqlite3_prepare_v2(db,[sqlQry UTF8String],-1,&stmt,nil)==SQLITE_OK ){
        while (sqlite3_step(stmt)==SQLITE_ROW) {
            char *name=(char *)sqlite3_column_text(stmt, 1);
            NSString *nsName=[[NSString alloc]initWithUTF8String:name];
            int age=sqlite3_column_int(stmt, 2);
            char *address=(char *)sqlite3_column_text(stmt, 3);
            NSString *nsAddress=[[NSString alloc]initWithUTF8String:address];
            NSLog(@"name:%@ age:%d address:%@",nsName,age,nsAddress);
        }
    }
}
- (IBAction)updatePerson:(id)sender{
    NSString *sql1 = [NSString stringWithFormat:@"update person set %@ = %@ ",AGE,@"45"];
    NSLog(@"%@",sql1);
    [self execSql:sql1];
    
}
- (IBAction)deletePerson:(id)sender{
    NSString *sql1 = [NSString stringWithFormat:@"delete from %@ where %@=%@",TABLENAME,AGE,@"45"];
    NSLog(@"%@",sql1);
    [self execSql:sql1];
}

@end
