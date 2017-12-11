//
//  ViewController.m
//  GCD
//
//  Created by J on 2017/12/7.
//  Copyright © 2017年 J. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0; i <5 ; i++) {
        Person *p = [Person sharePerson];
        NSLog(@"%p",p);
    }
    Person *pp = [[Person sharePerson]copy];
    NSLog(@"%p",pp);

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self gcdGroup];
    
    
}
static int x = 0;
static int y = 0;

-(void)gcdGroup{
//    创建一个队列组
    dispatch_group_t group =  dispatch_group_create();
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    添加异步子线程队列组1
    dispatch_group_async(group,queue, ^{
        NSLog(@"1---%@",[NSThread currentThread]);
        int i;
        for (i = 0 ; i<100; i++) {
            x = i;
        }
    });
    //    添加异步子线程队列组2
    dispatch_group_async(group,queue, ^{
        NSLog(@"2---%@",[NSThread currentThread]);
        int i;
        for (i = 0 ; i<100; i++) {
            y = i;
        }
    });
    //group 中所有 async 任务完成调用
    dispatch_group_notify(group, queue, ^{
        NSLog(@"3---%@",[NSThread currentThread]);
        //返回主线程进行操作
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"%@",@(x+y));
        });
        NSLog(@"------");

    });
}

-(void)apply{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<10; i++) {
        [array addObject:@(i)];
    }
    dispatch_apply(array.count, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t index) {
        NSLog(@"%@   ---- %@   ",[NSThread currentThread],array[index]);
    });
}

//在相同线程中  多次执行该线程同步操作 导致崩溃
-(void)carsh2{
    
    dispatch_queue_t queue  = dispatch_queue_create("当前线程 串行", NULL);
    dispatch_sync(queue, ^{
        NSLog(@"1-----%@",[NSThread currentThread]);
        dispatch_sync(queue, ^{
            NSLog(@"2-----%@",[NSThread currentThread]);
        });
    });
}

-(void)barrier{
   
//    _barrier 阻碍 带有该关键字的方法 会在前面的任务执行结束后才执行，而他后面的任务等他执行完成后才会执行
    dispatch_barrier_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    
    });
    
    
}

//在主线程中 多次 执行同步主线程 操作 导致崩溃
-(void)carsh
{
    NSLog(@"1");
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"1-----%@",[NSThread currentThread]);
    });
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"2-----%@",[NSThread currentThread]);
    });
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"3-----%@",[NSThread currentThread]);
    });
    NSLog(@"2");
}
/**
 异步线程
 */
-(void)async{
    dispatch_queue_t queue = [self serial];
    //将队列加入异步任务中
    dispatch_async(queue, ^{
        NSLog(@"1-----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"2-----%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"3-----%@",[NSThread currentThread]);
    });
}

/**
 同步线程
 */
-(void)sync{
    dispatch_queue_t queue = [self serial];
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"1-----%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"2-----%@",[NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"3-----%@",[NSThread currentThread]);
    });
    
}
/**
 并发队列
 */
-(dispatch_queue_t)concurrent{
    //创建一个并发队列
    //    label 队列标签
    //    attr 队列类型
    //    CONCURRENT 并发
    //    SERIAL 串行
    
    //    dispatch_queue_t queue = dispatch_queue_create("kings_queue", DISPATCH_QUEUE_CONCURRENT);
    
    //获得全局并发队列
    //    long identifier 为优先级
    //    DISPATCH_QUEUE_PRIORITY_XXXXX
    /*
     #define DISPATCH_QUEUE_PRIORITY_HIGH 2
     #define DISPATCH_QUEUE_PRIORITY_DEFAULT 0
     #define DISPATCH_QUEUE_PRIORITY_LOW (-2)
     #define DISPATCH_QUEUE_PRIORITY_BACKGROUND INT16_MIN
     */
    //优先级分为4中 一般常用默认
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    return queue;
}
/**
 串行队列
 */
-(dispatch_queue_t)serial{
    //#define DISPATCH_QUEUE_SERIAL NULL
//    其中NULL参数同样会产生串行队列
    dispatch_queue_t queue = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL);
    return queue;
    
   return dispatch_get_main_queue();

    
}
@end
