//
//  ViewController.m
//  AFNHTTPDemo
//
//  Created by wangx on 15/7/22.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking/AFNetworking.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(IBAction)getDemo:(id)sender{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    NSString *urlString=@"http://localhost:8080/AFNetworking/";
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",operation.response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@",error);
    }];
}

-(IBAction)postparamDemo:(id)sender{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    NSString *urlString=@"http://localhost:8080/AFNetworking/afnetwork/LoginRegistAction.do";
    NSDictionary *parameters=@{@"username":@"wangx",@"password":@"123456"};
    [manager GET:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",operation.response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@",error);
    }];
}
-(IBAction)postParamWithFile:(id)sender{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    NSString *urlString=@"http://localhost:8080/AFNetworking/afnetwork/LoginUploadAction.do";
    NSDictionary *parameters=@{@"username":@"wangx",@"password":@"123456"};
    NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/image.png"];
    NSURL *filePath=[NSURL fileURLWithPath:path];
    [manager POST:urlString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileURL:filePath name:@"upload" error:nil];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success:%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error:%@",error);
    }];
}

-(IBAction)downloadPost:(id)sender{
    NSURLSessionConfiguration *configuration=[NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager=[[AFURLSessionManager alloc]initWithSessionConfiguration:configuration];
    manager.responseSerializer=[AFImageResponseSerializer serializer];
    NSString *urlString=@"http://farm3.staticflickr.com/2846/9823925914_78cd653ac9_b_d.jpg";
    NSURL *url=[NSURL URLWithString:urlString];
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url];
    NSURLSessionDownloadTask *downloadTask=[manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentDirectoryURL=[[NSFileManager defaultManager]URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
         NSURL *url=[documentDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        return url;
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File download to:%@",filePath);
    } ];
    [downloadTask resume];
}

-(IBAction)postParamWithFiles:(id)sender{
    NSString *urlString=@"http://localhost:8080/AFNetworking/afnetwork/UploadAction.do";
    NSString *path1=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/image1.jpg"];
    NSURL *filePath1=[NSURL fileURLWithPath:path1];
    
    NSString *path2=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/image2.jpg"];
    NSURL *filePath2=[NSURL fileURLWithPath:path2];
    
    AFHTTPRequestSerializer *serialzer=[AFHTTPRequestSerializer serializer];
    NSMutableURLRequest *request=[serialzer multipartFormRequestWithMethod:@"POST" URLString:urlString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileURL:filePath1 name:@"upload" fileName:@"image1.jpg" mimeType:@"image/jpeg" error:nil];
        [formData appendPartWithFileURL:filePath2 name:@"upload" error:nil];
    } error:nil];
    
    NSURLSessionConfiguration *configuration=[NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager=[[AFURLSessionManager alloc]initWithSessionConfiguration:configuration];
    NSProgress *progress=nil;
    NSURLSessionUploadTask *uploadTask=[manager uploadTaskWithStreamedRequest:request progress:&progress completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error:%@",error);
        }else{
            NSLog(@"%@,%@",response,responseObject);
        }
    }];
    [uploadTask resume];
    
}
-(IBAction)postwithArray:(id)sender{
        //foo=bar&baz[]=1&baz[]=2&baz[]=3
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.requestSerializer=[AFHTTPRequestSerializer serializer];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
//    NSString *urlString=@"http://localhost:8080/AFNetworking/afnetwork/LoginParamWithArrayAction.do?foo=bar&baz=1&baz=2&baz=3";
    NSString *urlString=@"http://localhost:8080/AFNetworking/afnetwork/LoginParamWithArrayAction.do";
    NSDictionary *parameters=@{@"foo":@"bar",@"baz":@[@"1",@"2",@"3"]};
    [manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",operation.response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@",error);
    }];
}
-(IBAction)RequestOperation:(id)sender{
    NSURL *URL = [NSURL URLWithString:@"http://localhost:8080/AFNetworking/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@",operation.response);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    [[NSOperationQueue mainQueue] addOperation:op];
}
-(IBAction)requestBatch:(id)sender{
    NSMutableArray *mutableOperations = [NSMutableArray array];
    NSMutableArray *filesToUpload =[NSMutableArray array];
    NSString *path1=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/image1.jpg"];
    NSURL *filePath1=[NSURL fileURLWithPath:path1];
    [filesToUpload addObject:filePath1];
    for (NSURL *fileURL in filesToUpload) {
        NSURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:@"http://localhost:8080/AFNetworking/afnetwork/LoginUploadAction.do" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            [formData appendPartWithFileURL:fileURL name:@"upload" error:nil];
        }];
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        
        [mutableOperations addObject:operation];
    }
    
    NSArray *operations = [AFURLConnectionOperation batchOfRequestOperations:mutableOperations progressBlock:^(NSUInteger numberOfFinishedOperations, NSUInteger totalNumberOfOperations) {
        NSLog(@"%lu of %lu complete", numberOfFinishedOperations, totalNumberOfOperations);
    } completionBlock:^(NSArray *operations) {
        NSLog(@"All operations in batch complete");
    }];
    [[NSOperationQueue mainQueue] addOperations:operations waitUntilFinished:NO];
    
}
@end
