//
//  GyroManager.h
//  0.3加速计CoreMotion
//
//  Created by J on 2017/12/11.
//  Copyright © 2017年 J. All rights reserved.
//

#import "KingMotionManager.h"
//陀螺仪对象
@interface GyroManager : KingMotionManager

/**
 在自定义线程中实时获取陀螺仪信息
 
 @param queue 自定义线程
 @param handler 回调
 */
-(void)startGyroInQueue:(NSOperationQueue *_Nullable)queue andHander:(void (^_Nullable)(CMGyroData * _Nullable gyroData, NSError * _Nullable error))handler;


/**
 在主线程中实时获取陀螺仪信息
 
 @param handler 回调函数
 */
-(void)startGyroInMainQueue:(void (^_Nullable)(CMGyroData * _Nullable gyroData, NSError * _Nullable error))handler;


/**
 在主线程中获取一次当前陀螺仪信息
 
 @param hander 加速计信息回调
 */
-(void)getGyroDataWithHander:(void(^_Nullable)(CMGyroData *_Nonnull gyroData))hander;


@end
