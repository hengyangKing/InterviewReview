//
//  ViewController.m
//  HTTPS
//
//  Created by J on 2017/12/12.
//  Copyright © 2017年 J. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionTaskDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:([NSURLSessionConfiguration defaultSessionConfiguration]) delegate:self delegateQueue:([[NSOperationQueue alloc]init])];
    
    NSURLSessionTask *task = [session dataTaskWithURL:[NSURL URLWithString:@"https://www.apple.com/cn/"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:(NSUTF8StringEncoding)]);
    }];
    [task resume];
}
#pragma mark nsrulsessiontaskdelegate
-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler{
    
    //判断当前请求的证书类型是否是服务器信任类型证书
    if (![challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {return;}
//    void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable)
//    NSURLSessionAuthChallengeDisposition 如何处理这个安全证书
//    NSURLCredential 安全证书
    //根据服务器的信任信息 创建证书对象
    NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
//   利用block 说明使用该证书
    
    !completionHandler ? :    completionHandler(NSURLSessionAuthChallengeUseCredential,credential);
}




@end
