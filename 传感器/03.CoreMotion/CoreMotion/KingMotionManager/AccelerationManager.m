//
//  AccelerationManager.m
//  0.3加速计CoreMotion
//
//  Created by J on 2017/12/11.
//  Copyright © 2017年 J. All rights reserved.
//

#import "AccelerationManager.h"
@interface AccelerationManager()
@property(nonatomic,strong)CMMotionManager *manager;

@end
@implementation AccelerationManager
-(CMMotionManager *)manager
{
    if (!_manager) {
        //        创建运动管理者对象
        _manager = [[CMMotionManager alloc]init];
        //        设置采样间隔
        _manager.accelerometerUpdateInterval = 1/30.0;
    }
    return _manager;
}
-(BOOL)isAvailable{
    return self.manager.accelerometerAvailable;
}

-(void (^)(float))updateInterval {
    __weak typeof(self) weakself = self;
    return ^(float time){
        if (time>0) {
            weakself.manager.accelerometerUpdateInterval =time;
        }
    };
}
-(void)startAccelerometerInQueue:(NSOperationQueue *_Nullable)queue andHander:(void (^_Nullable)(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error))handler{
    
    if (!self.isAvailable) {
        handler(NULL,[NSError errorWithDomain:(@"您的手机陀螺仪故障 调适后再试") code:-1000 userInfo:nil]);
        return;
    }
    [self.manager startAccelerometerUpdatesToQueue:queue withHandler:handler];
}
-(void)startAccelerometerInMainQueue:(void (^_Nullable)(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error))handler {
    [self startAccelerometerInQueue:[NSOperationQueue mainQueue] andHander:handler];
}

-(void)getAccelerometerDataWithHander:(void(^_Nullable)(CMAccelerometerData *_Nonnull))hander{
    if (hander) {
        [self.manager startAccelerometerUpdates];
        hander(self.manager.accelerometerData);
    }
}
-(void)stop
{
    [self.manager stopAccelerometerUpdates];
}
@end
