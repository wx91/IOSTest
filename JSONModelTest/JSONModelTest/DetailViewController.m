//
//  DetailViewController.m
//  JSONModelTest
//
//  Created by wangx on 15/7/25.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "DetailViewController.h"

@implementation DetailViewController

-(void)loadView{
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.data count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentifier=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        cell.textLabel.text=[self.data objectAtIndex:indexPath.row];
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
    }
    return cell;
}

@end
