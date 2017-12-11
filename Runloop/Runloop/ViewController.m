//
//  ViewController.m
//  Runloop
//
//  Created by J on 2017/12/4.
//  Copyright © 2017年 J. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self runloop];
    [self timer];
}
/**
 当前runloop
 */
-(void)runloop
{
    NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];
    NSRunLoop *mainRunLoop = [NSRunLoop mainRunLoop];
    
    if ([currentRunLoop isEqual:mainRunLoop]) {
        NSLog(@"is same runloop");
    }
    NSThread *subThread = [[NSThread alloc]initWithTarget:self selector:@selector(subLoop) object:nil];
    [subThread start];
    
    
    
}
-(void)timer{
//    其中 scheduledTimerWithTimeInterval方法将其默认添加进当前currentRunloop
//    NSTimer *scheduledTimer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
//    上述代码等价于
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
    
    //timer只运行在default mode 下 其他模式并不工作
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:(NSDefaultRunLoopMode)];
    //timer会运行在被系统标记为common modes 的模式下
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:(NSRunLoopCommonModes)];
    
    NSLog(@"%@",[NSRunLoop currentRunLoop]);
    //查看当前runloop 发现有两个Mode 被标记为common modes
    /**
     common modes = <CFBasicHash 0x600000059c80 [0x10721b960]>{type = mutable set, count = 2,
     entries =>
     0 : <CFString 0x10858b060 [0x10721b960]>{contents = "UITrackingRunLoopMode"}
     2 : <CFString 0x1071f1790 [0x10721b960]>{contents = "kCFRunLoopDefaultMode"}
     }
     */
}
-(void)timerRun
{
    NSLog(@"timer run");
}
-(void)subLoop{
    NSLog(@"subThread");
    //子线程不会自动创建runloop 需要手动创建
    //且 runloop 对象懒加载，在第一次访问当前线程创建的runloop对象时会创建该对象
    
    NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];
    NSLog(@"%p",currentRunLoop);
}


@end
