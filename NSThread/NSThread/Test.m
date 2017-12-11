//
//  Test.m
//  NSThread
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import "Test.h"


@implementation Test
//构造方法创建线程
-(void)createThread
{
    NSThread *testThread = [[NSThread alloc]initWithTarget:self selector:@selector(foo:) object:@{@"fooKey":@"fooValue"}];
    [testThread setName:@"thread1"];
    [testThread start];
}
//工厂方法创建线程
-(void)createThread2{
//    detach 分离
//    并且直接start 既快速创建一条子线程执行
    [NSThread detachNewThreadSelector:@selector(foo:) toTarget:self withObject:@{@"fooKey":@"fooValue"}];
}
//隐式方法创建
-(void)createThread3{

    [self performSelectorInBackground:@selector(foo:) withObject:@{@"fooKey":@"fooValue"}];
    
}



-(void)foo:(id)par{
    NSLog(@"currentThread ---%@",[NSThread currentThread]);
    NSLog(@"mainThread ---%@",[NSThread mainThread]);

    NSLog(@"%@",par);
}
@end
