//
//  AccelerationManager.h
//  0.3加速计CoreMotion
//
//  Created by J on 2017/12/11.
//  Copyright © 2017年 J. All rights reserved.
//

#import "KingMotionManager.h"
//加速计对象
@interface AccelerationManager : KingMotionManager
/**
 在自定义线程中实时获取加速计信息
 
 @param queue 自定义线程
 @param handler 回调
 */
-(void)startAccelerometerInQueue:(NSOperationQueue *_Nullable)queue andHander:(void (^_Nullable)(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error))handler;

/**
 在主线程中实时获取加速计信息
 
 @param handler 回调函数
 */
-(void)startAccelerometerInMainQueue:(void (^_Nullable)(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error))handler;


/**
 在主线程中获取一次当前加速计信息
 
 @param hander 加速计信息回调
 */
-(void)getAccelerometerDataWithHander:(void(^_Nullable)(CMAccelerometerData *_Nonnull))hander;

@end
