//
//  TableViewController.m
//  多图片下载
//
//  Created by J on 2017/12/7.
//  Copyright © 2017年 J. All rights reserved.
//

#import "TableViewController.h"
#import "XMGApp.h"
@interface TableViewController ()
@property(nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSMutableDictionary *imageCache;
@property (nonatomic,strong)NSOperationQueue *queue;

/**
 缓存用户操作
 */
@property(nonatomic,strong)NSMutableDictionary *operations;

@end

@implementation TableViewController

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"apps.plist" ofType:nil]];
        
        NSMutableArray *appArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            [appArray addObject:[XMGApp appWithDict:dict]];
        }
        _dataArray = [NSMutableArray arrayWithArray:appArray];
        
    }
    return _dataArray;
    
}
-(NSMutableDictionary *)imageCache
{
    if (!_imageCache) {
        _imageCache = [NSMutableDictionary dictionary];
    }
    return _imageCache;
}
-(NSOperationQueue *)queue
{
    if (!_queue) {
        _queue = [[NSOperationQueue alloc]init];
        _queue.maxConcurrentOperationCount = 3;
    }
    return _queue;
}
-(NSMutableDictionary *)operations
{
    if(!_operations){
        _operations = [NSMutableDictionary dictionary];
    }
    return _operations;
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"app"];
    
    
    XMGApp *app = self.dataArray[indexPath.row];
    cell.textLabel.text = app.name;
    cell.detailTextLabel.text = app.download;
    // 下载图片
    UIImage *image = self.imageCache[app.icon];
    if (image) {
        
    }else{
        //内存中不存在 检查手机缓存
        NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];

        NSString *fileName = [app.icon lastPathComponent];
        NSString *filePath = [cachesPath stringByAppendingPathComponent:fileName];
        
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        if (data) {
            cell.imageView.image = [UIImage imageWithData:data];
            
        }else{
            //检查当前url 的下载是否存在
            NSOperation *operation =self.operations[app.icon];
            if (!operation) {
                //没有下载
                operation =[NSBlockOperation blockOperationWithBlock:^{
                    NSData  *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:app.icon]];
                    UIImage *image = [UIImage imageWithData:data];
                    //回到主线程刷新图片
                    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
                        cell.imageView.image = image;
                        
                    }];
                    //存入字典
                    self.imageCache[app.icon] = image;
                    //写入沙盒
                    [data writeToFile:filePath atomically:YES];
                }];
                //添加到队列中
                [self.queue addOperation:operation];
                //将当前队列 存在字典中
                self.operations[app.icon] = operation;
            }
        }
    }
    
    return cell;
}
/*
 Documents -- 会被备份到 apple 服务器
 Library
 - Caches -- 存在文件的首选
 - Preference --
 tmp  -- 随时会被清理
 */



@end
