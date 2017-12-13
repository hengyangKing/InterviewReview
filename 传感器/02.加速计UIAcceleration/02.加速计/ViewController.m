//
//  ViewController.m
//  02.加速计
//
//  Created by J on 2017/12/11.
//  Copyright © 2017年 J. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Ball.h"
@interface ViewController ()<UIAccelerometerDelegate>
@property (weak, nonatomic) IBOutlet Ball *ball;
//保留x，y上的速度
@property(nonatomic,assign)CGPoint velocity;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self stringCopy];
    
    
}
-(void)accelerometer{
    
    //设置代理
    [[UIAccelerometer sharedAccelerometer]setDelegate:self];
    //设置采样间隔
    [[UIAccelerometer sharedAccelerometer]setUpdateInterval:1/30.0];
}
//获取到加速计信息
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration{
    
    NSLog(@"x:%f y:%f z:%f ",acceleration.x,acceleration.y,acceleration.z);
    
    self.ball.Acceleration(acceleration);
}

-(void)stringCopy{
    Person *p = [Person new];
    
    NSString *foo = [NSString stringWithFormat:@"123"];
    NSLog(@"foo---%p",foo);
    
    
    p.str1 = foo;
    p.str2 = foo;
    NSLog(@"str1---%p,%@",p.str1,p.str1);
    
    NSLog(@"str2---%p,%@",p.str2,p.str2);
   
    
    foo = @"0000000";
    
    NSLog(@"str1---%@",p.str1);
    
    NSLog(@"str2---%@",p.str2);
    
    
}


@end
