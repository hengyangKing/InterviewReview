//
//  ViewController.m
//  NSOperation
//
//  Created by J on 2017/12/7.
//  Copyright © 2017年 J. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self blockOperation];
    [self OperationQueue];
}
-(void)OperationQueue{
//    NSOperationQueue 的队列类型
    //    主队列 [NSOperationQueue mainQueue];
//            凡是添加到主队列中的任务（NSOperation） 都会放在住线程中进行
    //    其他队列（并发队列 串行队列） [[NSOperationQueue alloc]init] 默认是并发队列
//            凡是添加到其他队列中的任务（NSOperation） 都会放在子线程中进行
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    queue.maxConcurrentOperationCount = 1;
    NSInvocationOperation *operation1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(foo1) object:nil];

    NSInvocationOperation *operation2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(foo2) object:nil];
    
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"block-----%@",[NSThread currentThread]);

    }];
    [queue addOperation:operation1];
    [queue addOperation:operation2];
    [queue addOperation:blockOperation];
}
-(void)blockOperation{
    //添加主任务 默认在主线程
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1-----%@",[NSThread currentThread]);
    }];
    //添加额外任务 在子线程
    [op addExecutionBlock:^{
        NSLog(@"2-----%@",[NSThread currentThread]);

    }];
    //添加额外任务 在子线程
    [op addExecutionBlock:^{
        NSLog(@"3-----%@",[NSThread currentThread]);
        
    }];
    //添加额外任务 在子线程
    [op addExecutionBlock:^{
        NSLog(@"4-----%@",[NSThread currentThread]);
    }];
    [op start];
}

-(void)invocation
{
    NSInvocationOperation *operation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(foo) object:nil];
    [operation start];
}

-(void)foo{
    NSLog(@"%s------%@",__func__,[NSThread currentThread]);
}
-(void)foo1{
    NSLog(@"foo1------%@",[NSThread currentThread]);
}
-(void)foo2{
    NSLog(@"foo2------%@",[NSThread currentThread]);
}


@end
