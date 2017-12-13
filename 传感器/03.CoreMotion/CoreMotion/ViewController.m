//
//  ViewController.m
//  0.3加速计CoreMotion
//
//  Created by J on 2017/12/11.
//  Copyright © 2017年 J. All rights reserved.
//

#import "ViewController.h"
#import "KingMotionManager.h"
#import "AccelerationManager.h"
#import "PedometerManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    KingMotionManager *manager = [KingMotionManager sharedInstance];
    

    AccelerationManager *acceleration = [AccelerationManager sharedInstance];
    
    
    PedometerManager *pedomter = [PedometerManager sharedInstance];
    
    NSLog(@"%p = KingMotionManager ",manager);
    NSLog(@"%p = AccelerationManager ",acceleration);
    NSLog(@"%p = PedometerManager ",pedomter);
    NSLog(@"%p = KingMotionManager ",[KingMotionManager sharedInstance]);

    




}
@end
