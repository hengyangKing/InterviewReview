//
//  GyroManager.m
//  0.3加速计CoreMotion
//
//  Created by J on 2017/12/11.
//  Copyright © 2017年 J. All rights reserved.
//

#import "GyroManager.h"
@interface GyroManager()
@property(nonatomic,strong)CMMotionManager *manager;
@end
@implementation GyroManager
-(CMMotionManager *)manager
{
    if (!_manager) {
        //        创建运动管理者对象
        _manager = [[CMMotionManager alloc]init];
        //        设置采样间隔
        _manager.gyroUpdateInterval = 1/30.0;
    }
    return _manager;
}

-(BOOL)isAvailable{
    return self.manager.gyroAvailable;
}

-(void (^)(float))updateInterval {
    __weak typeof(self) weakself = self;
    return ^(float time){
        if (time>0) {
            weakself.manager.gyroUpdateInterval =time;
        }
    };
}
/**
 在自定义线程中实时获取陀螺仪信息
 
 @param queue 自定义线程
 @param handler 回调
 */
-(void)startGyroInQueue:(NSOperationQueue *_Nullable)queue andHander:(void (^_Nullable)(CMGyroData * _Nullable gyroData, NSError * _Nullable error))handler{
    if (!self.isAvailable) {
        handler(NULL,[NSError errorWithDomain:(@"您的手机陀螺仪故障 调适后再试") code:-1000 userInfo:nil]);
        return;
    }
    [self.manager startGyroUpdatesToQueue:queue withHandler:handler];
}


/**
 在主线程中实时获取陀螺仪信息
 
 @param handler 回调函数
 */
-(void)startGyroInMainQueue:(void (^_Nullable)(CMGyroData * _Nullable gyroData, NSError * _Nullable error))handler{
    [self startGyroInQueue:[NSOperationQueue mainQueue] andHander:handler];
}


/**
 在主线程中获取一次当前陀螺仪信息
 
 @param hander 加速计信息回调
 */
-(void)getGyroDataWithHander:(void(^_Nullable)(CMGyroData *_Nonnull gyroData))hander{
    if (!self.isAvailable) {return;}
    if (hander) {
        [self.manager startGyroUpdates];
        hander(self.manager.gyroData);
    }
}

-(void)stop{
    [self.manager stopGyroUpdates];
}



@end
