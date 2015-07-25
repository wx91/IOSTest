//
//  ViewController.m
//  ASIHTTPRequestDemo
//
//  Created by wangx on 15/7/24.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import "ViewController.h"
#import "ASIHTTPRequest.h"
#import "ASINetworkQueue.h"
#import "ASIFormDataRequest.h"
#import "ASIDownloadCache.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//采用同步请求
-(IBAction)getSynchronous:(id)sender{
    NSString *urlString=@"http://localhost:8080/AFNetworking/";
    NSURL *url=[NSURL URLWithString:urlString];
    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
    [request startSynchronous];
    NSError *error=[request error];
    if (!error) {
        NSString *response=[request responseString];
        NSLog(@"%@",response);
    }
}
//使用异步请求的方式，采用代理方法来获取数据
-(IBAction)getAsynchronousWithDelegate:(id)sender{
    NSString *urlString=@"http://localhost:8080/AFNetworking/";
    NSURL *url=[NSURL URLWithString:urlString];
    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
    request.delegate=self;
    [request startAsynchronous];
}
-(void)requestFinished:(ASIHTTPRequest *)request{
    NSString *responseString=[request responseString];
    NSLog(@"%@",responseString);
}
-(void)requestFailed:(ASIHTTPRequest *)request{
    NSError *error=[request error];
    NSLog(@"%@",error);
}
//使用异步提交的方式，采用block来获取数据
-(IBAction)getAsynchronousWithBlock:(id)sender{
    NSString *urlString=@"http://localhost:8080/AFNetworking/";
    NSURL *url=[NSURL URLWithString:urlString];
    __block ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
    [request startAsynchronous];
    [request setCompletionBlock:^{
        NSString *responseString=[request responseString];
        NSLog(@"%@",responseString);
    }];
    [request setFailedBlock:^{
        NSError *error=[request error];
        NSLog(@"%@",error);
    }];
}
//使用队列的方法是来请求数据
-(IBAction)queue:(id)sender{
    ASINetworkQueue *queue=[ASINetworkQueue queue];
    queue.maxConcurrentOperationCount=4;
    NSString *urlString=@"http://localhost:8080/AFNetworking/";
    NSURL *url=[NSURL URLWithString:urlString];
    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
    request.delegate=self;
    [request setDidFinishSelector:@selector(requestDone:)];
    [request setDidFailSelector:@selector(requestWentWrong:)];
    [queue addOperation:request];
    [queue go];
}
-(void)requestDone:(ASIHTTPRequest *)request{
    NSString *response=[request responseString];
    NSLog(@"%@",response);
}
-(void)requestWentWrong:(ASIHTTPRequest *)request{
    NSError *error=[request error];
    NSLog(@"%@",error);
}

//使用post传递除文件外一般数据类型参数
-(IBAction)postWithParam:(id)sender{
    NSString *urlString=@"http://localhost:8080/AFNetworking/afnetwork/LoginRegistAction.do";
    NSURL *url=[NSURL URLWithString:urlString];
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    [request setPostValue:@"wangx" forKey:@"username"];
    [request setPostValue:@"123456" forKey:@"password"];
    [request startSynchronous];
    NSError *error=[request error];
    if (!error) {
        NSString *response=[request responseString];
        NSLog(@"%@",response);
    }
}
//使用post传递除文件外一般数据类型参数
-(IBAction)postWithParamArray:(id)sender{
    NSString *urlString=@"http://localhost:8080/AFNetworking/afnetwork/LoginParamWithArrayAction.do";
    NSURL *url=[NSURL URLWithString:urlString];
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    [request setPostValue:@[@"1",@"2",@"3"] forKey:@"baz"];
    [request setPostValue:@"bar" forKey:@"foo"];
    [request startSynchronous];
    NSError *error=[request error];
    if (!error) {
        NSString *response=[request responseString];
        NSLog(@"%@",response);
    }
}
//使用post传递单个文件和一般参数类型
-(IBAction)postWithParamFile:(id)sender{
    NSString *urlString=@"http://localhost:8080/AFNetworking/afnetwork/UploadAction.do";
    NSURL *url=[NSURL URLWithString:urlString];
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    [request setPostValue:@"1" forKey:@"username"];
    [request setPostValue:@"2" forKey:@"password"];
    NSString *file1=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/image.jpg"];
    [request addFile:file1 forKey:@"upload"];
    [request startSynchronous];
    NSError *error=[request error];
    if (!error) {
        NSString *response=[request responseString];
        NSLog(@"%@",response);
    }
}
//使用post传递多个文件
-(IBAction)postWithParamFiles:(id)sender{
    NSString *urlString=@"http://localhost:8080/AFNetworking/afnetwork/UploadsAction.do";
    NSURL *url=[NSURL URLWithString:urlString];
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    NSString *file1=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/image.jpg"];
    NSString *file2=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/image1.jpg"];
    [request setPostValue:@"1" forKey:@"username"];
    [request setPostValue:@"2" forKey:@"password"];
    [request addFile:file1 forKey:@"upload"];
    [request addFile:file2 withFileName:@"image1.jpg" andContentType:@"image/jpeg" forKey:@"upload"];
    [request startSynchronous];
    NSError *error=[request error];
    if (!error) {
        NSString *response=[request responseString];
        NSLog(@"%@",response);
    }
}

//下载图片文件
-(IBAction)downloadPhoto:(id)sender{
    NSString *urlString=@"http://farm3.staticflickr.com/2846/9823925914_78cd653ac9_b_d.jpg";
    NSURL *url=[NSURL URLWithString:urlString];
    NSString *document=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *fileName=[urlString lastPathComponent];
    NSString *path=[document stringByAppendingPathComponent:fileName];
    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
    //设置文件存放路径
    [request setDownloadDestinationPath:path];
    //设置进度条
    UIProgressView *progressView=[[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    progressView.frame=CGRectMake(300, 100, 100, 20);
    request.downloadProgressDelegate=progressView;
    [request startAsynchronous];
}
//文件解压
-(IBAction)downloadGiz:(id)sender{
    NSString *urlString=@"http://localhost:8080/AFNetworking/afnetwork/download2";
    NSURL *url=[NSURL URLWithString:urlString];
    NSString *document=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *fileName=[urlString lastPathComponent];
    NSString *path=[document stringByAppendingPathComponent:fileName];
    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:url];
    //设置文件存放路径
    [request setDownloadDestinationPath:path];
    [request startAsynchronous];
}
//上传data文件
- (IBAction)postWithData:(id)sender{
    
}
//断点续传
- (IBAction)resumeInterruptedDownload:(id)sender{
    
    NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *folderPath=[path stringByAppendingPathComponent:@"tmp"];
    NSFileManager *fileManager=[NSFileManager defaultManager];
    BOOL fileExists=[fileManager fileExistsAtPath:folderPath];
    if (!fileExists) {
        [fileManager createDirectoryAtPath:folderPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *urlString=@"http://farm3.staticflickr.com/2846/9823925914_78cd653ac9_b_d.jpg";
    NSURL *url=[NSURL URLWithString:urlString];
    ASIHTTPRequest *request=[[ASIHTTPRequest alloc]initWithURL:url];
    [request setDownloadProgressDelegate:self];
    [request setTemporaryFileDownloadPath:folderPath];
    [request setAllowResumeForFileDownloads:YES];
    
    
}

//设置缓存
-(IBAction)ASIHTTPRequestcache:(id)sender{
    NSString *urlString=@"http://farm3.staticflickr.com/2846/9823925914_78cd653ac9_b_d.jpg";
    NSURL *url=[NSURL URLWithString:urlString];
    NSString *cachePath=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *fileName=[urlString lastPathComponent];
    NSString *path=[cachePath stringByAppendingPathComponent:fileName];
    //创建缓存对象
    ASIDownloadCache *cache=[[ASIDownloadCache alloc]init];
    [cache setStoragePath:cachePath];
    //设置缓存策略
    cache.defaultCachePolicy=ASIOnlyLoadIfNotCachedCachePolicy;
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
    request.cacheStoragePolicy=ASICachePermanentlyCacheStoragePolicy;
    [request setDownloadCache:path];
    //开始异步网络请求
    [request startAsynchronous];
    //设置文件存放路径
    [request setDownloadDestinationPath:cachePath];
    //设置网络请求完成后的block
    [request setCompletionBlock:^{
        NSString *responseString=request.responseString;
        //打印返回数据
        NSLog(@"%@",responseString);
        //判断数据的来源是网络还是本地缓存
        if (request.didUseCachedResponse) {
            NSLog(@"数据来自缓存");
        }else{
            NSLog(@"数据来自于网络");
        }
    }];
}

@end
