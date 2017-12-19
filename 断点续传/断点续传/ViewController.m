//
//  ViewController.m
//  断点续传
//
//  Created by J on 2017/12/18.
//  Copyright © 2017年 J. All rights reserved.
//

#import "ViewController.h"

// 文件的存放路径（caches）
#define Mp4File [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"test.mp4"]

// 文件的已下载长度
#define DownloadLength [[[NSFileManager defaultManager] attributesOfItemAtPath: Mp4File error:nil][NSFileSize] integerValue]

#define STR @"100"
@interface ViewController ()<NSURLSessionDataDelegate>
/** 下载任务 */
@property (nonatomic, strong) NSURLSessionDataTask *task;
/** session */
@property (nonatomic, strong) NSURLSession *session;
/** 写文件的流对象 */
@property (nonatomic, strong) NSOutputStream *stream;
/** 文件的总长度 */
@property (nonatomic, assign) NSInteger totalLength;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%p   --- %p",STR,STR);
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static int i =0;
    NSLog(@"%p",@(i));
}
- (NSURLSession *)session
{
    if (!_session) {
        _session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc] init]];
    }
    return _session;
}

- (NSOutputStream *)stream
{
    if (!_stream) {
        _stream = [NSOutputStream outputStreamToFileAtPath:Mp4File append:YES];
    }
    return _stream;
}

-(void)star{
    
    //可变请求 用于更改请求头
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://120.25.226.186:32812/resources/videos/minion_01.mp4"]];

    //设置请求头
    //其中 @"bytes=0-100" 表示下载从0-100 kb内容
    //@"bytes=100-" 表示从100到直到文件最后
//    [request setValue:@"bytes=0-100" forHTTPHeaderField:@"Range"];
    NSString *range = [NSString stringWithFormat:@"bytes=%zd-", DownloadLength];
    [request setValue:range forHTTPHeaderField:@"Range"];

    // 创建一个Data任务
    self.task = [self.session dataTaskWithRequest:request];
    
    // 启动任务
    [self.task resume];
    
    
    
}

/**
 * 暂停下载
 */
- (IBAction)pause:(id)sender {
    [self.task suspend];
}

/**
 * 继续下载
 */
- (IBAction)goOn:(id)sender {
    [self.task resume];
}

#pragma mark - <NSURLSessionDataDelegate>
/**
 * 1.接收到响应
 */
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSHTTPURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    // 打开流
    [self.stream open];
    
    // 获得服务器这次请求 返回数据的总长度
    self.totalLength = [response.allHeaderFields[@"Content-Length"] integerValue] + DownloadLength;
    
    // 接收这个请求，允许接收服务器的数据
    completionHandler(NSURLSessionResponseAllow);
}

/**
 * 2.接收到服务器返回的数据（这个方法可能会被调用N次）
 */
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    // 写入数据
    [self.stream write:data.bytes maxLength:data.length];
    
    // 下载进度
    NSLog(@"%f", 1.0 * DownloadLength / self.totalLength);
}

/**
 * 3.请求完毕（成功\失败）
 */
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    // 关闭流
    [self.stream close];
    self.stream = nil;
}


@end
