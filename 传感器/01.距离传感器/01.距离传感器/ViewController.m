//
//  ViewController.m
//  01.距离传感器
//
//  Created by J on 2017/12/11.
//  Copyright © 2017年 J. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //打开距离传感器 proximity Monitoring Enabled 接近检测功能
    [UIDevice currentDevice].proximityMonitoringEnabled = YES;
    
    
    //有物品靠近和离开 需要监听通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(proximityStateDidChange:) name:UIDeviceProximityStateDidChangeNotification object:nil];
}

/**
 距离改变通知
 */
-(void)proximityStateDidChange:(NSNotificationCenter *)nav
{
    //返回当前状态 是否有物品靠近
    NSLog(@"%@",@([UIDevice currentDevice].proximityState));
}
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceProximityStateDidChangeNotification object:nil];
}


@end
