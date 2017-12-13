//
//  PedometerManager.m
//  0.3加速计CoreMotion
//
//  Created by J on 2017/12/11.
//  Copyright © 2017年 J. All rights reserved.
//

#import "PedometerManager.h"
#import <CoreMotion/CoreMotion.h>
@interface PedometerManager()
@property(nonatomic,strong)CMPedometer *pedometer;
@end
@implementation PedometerManager
-(CMPedometer *)pedometer
{
    if (!_pedometer) {
        _pedometer = [[CMPedometer alloc]init];
    }
    return _pedometer;
}
-(BOOL)isAvailable
{
    return [CMPedometer isStepCountingAvailable];
}
-(void)startWithHander:(CMPedometerEventHandler)hander{
    if (!self.isAvailable) {
        return;
    }
    [self.pedometer startPedometerEventUpdatesWithHandler:hander];
}
-(void)startWithDate:(NSDate *)date andHander:(CMPedometerHandler)hander{
    if (!self.isAvailable) {
        return;
    }
    [self.pedometer startPedometerUpdatesFromDate:date withHandler:hander];
}
-(void)queryPedometerDataFromDate:(NSDate *)fromdate andHander:(CMPedometerHandler)hander{
    
    [self.pedometer queryPedometerDataFromDate:fromdate toDate:[NSDate date] withHandler:hander];
    
}



@end
