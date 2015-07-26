//
//  ViewController.m
//  JSONModelTest
//
//  Created by wangx on 15/7/25.
//  Copyright (c) 2015年 wangx. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "Order.h"
#import "Order1.h"
#import "Order2.h"
#import "Order3.h"
#import "Product.h"
#import "Product1.h"
#import "Product2.h"
#import "MainViewController.h"
#import "DetailViewController.h"
#import "JSONHTTPClient.h"

@implementation MainViewController{
    NSArray *data;
    NSArray *response;
}
-(void)loadView{
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    data=@[@"Automatic name based mapping",@"Model cascading",@"Model collections",@"Key mapping",@"Map automatically under_score case to camelCase",@"Optional properties",@"Ignored properties",@"Make all model properties optional"];
    //加载网络中的数据
    NSString *urlString=@"http://localhost:8080/AFNetworking/afnetwork/JSONProvideAction.do";
    [JSONHTTPClient postJSONFromURLWithString:urlString params:nil completion:^(id json, JSONModelError *err) {
        response=json;
        NSLog(@"%@",json);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [data count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentifier=@"Cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        cell.textLabel.text=[data objectAtIndex:indexPath.row];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *controller=[[DetailViewController alloc]init];
    NSMutableArray *array=[NSMutableArray array];
    NSArray *ary=[response objectAtIndex:0];
    if(indexPath.row==0){
        NSDictionary *dic=[ary objectAtIndex:indexPath.row];
        Product *pm=[[Product alloc]initWithDictionary:dic error:nil];
        [array addObject:[NSString stringWithFormat:@"%d",pm.id]];
        [array addObject:pm.name];
        [array addObject:[NSString stringWithFormat:@"%f",pm.price]];
    }
    if (indexPath.row==1) {
        NSDictionary *dic=[ary objectAtIndex:indexPath.row];
        Order *order=[[Order alloc]initWithDictionary:dic error:nil];
        [array addObject:[NSString stringWithFormat:@"%d",order.order_id]];
        [array addObject:[NSString stringWithFormat:@"%f",order.total_price]];
        Product *pm=order.product;
        [array addObject:[NSString stringWithFormat:@"%d",pm.id]];
        [array addObject:pm.name];
        [array addObject:[NSString stringWithFormat:@"%f",pm.price]];
    }
    if (indexPath.row==2) {
        NSDictionary *dic=[ary objectAtIndex:indexPath.row];
        Order1 *order=[[Order1 alloc]initWithDictionary:dic error:nil];
        [array addObject:[NSString stringWithFormat:@"%d",order.order_id]];
        [array addObject:[NSString stringWithFormat:@"%f",order.total_price]];
        NSArray *pms=order.products;
        Product *pm=[[Product alloc]initWithDictionary:[pms objectAtIndex:0] error:nil];
        [array addObject:[NSString stringWithFormat:@"%d",pm.id]];
        [array addObject:pm.name];
        [array addObject:[NSString stringWithFormat:@"%f",pm.price]];
         Product *pm1=[[Product alloc]initWithDictionary:[pms objectAtIndex:1] error:nil];
        [array addObject:[NSString stringWithFormat:@"%d",pm1.id]];
        [array addObject:pm1.name];
        [array addObject:[NSString stringWithFormat:@"%f",pm1.price]];
    }
    //尚未实现
    if (indexPath.row==3) {
        NSDictionary *dic=[ary objectAtIndex:indexPath.row];
        Order2 *order=[[Order2 alloc]initWithDictionary:dic error:nil];
        [array addObject:[NSString stringWithFormat:@"%d",order.id]];
        [array addObject:order.productName];
        [array addObject:[NSString stringWithFormat:@"%f",order.price]];
    }
    if (indexPath.row==4) {
        NSDictionary *dic=[ary objectAtIndex:indexPath.row];
        Order3 *order=[[Order3 alloc]initWithDictionary:dic error:nil];
        [array addObject:[NSString stringWithFormat:@"%d",order.orderId]];
        [array addObject:order.orderProduct];
        [array addObject:[NSString stringWithFormat:@"%f",order.orderPrice]];
    }
    if (indexPath.row==5) {
        NSDictionary *dic=[ary objectAtIndex:indexPath.row];
        Product1 *p =[[Product1 alloc]initWithDictionary:dic error:nil];
        [array addObject:[NSString stringWithFormat:@"%d",p.id]];
//        [array addObject:p.name]; String* nil
        [array addObject:[NSString stringWithFormat:@"%f",p.price]];
//        [array addObject:p.uuid.stringValue]; NSNumber* nil
        //其中nil不能插入array
    }
    if (indexPath.row==6) {
        NSDictionary *dic=[ary objectAtIndex:indexPath.row];
        Product2 *p =[[Product2 alloc]initWithDictionary:dic error:nil];
        [array addObject:[NSString stringWithFormat:@"%d",p.id]];
        //由于忽略导致customProperty 为nil不能添加到array
    }
    
    controller.data=array;
   [self.navigationController pushViewController:controller animated:YES];
}


@end
