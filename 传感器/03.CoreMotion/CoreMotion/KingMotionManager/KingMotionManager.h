//
//  KingMotionManager.h
//  0.3加速计CoreMotion
//
//  Created by J on 2017/12/11.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>
@interface KingMotionManager : NSObject
+(instancetype _Nonnull )sharedInstance;

/**
 判断设备硬件是否可用
 */
@property(nonatomic,assign,readonly,getter=isAvailable)BOOL available;
/**
 修改自动更新信息时回调时间
 */
@property(nonatomic,copy,readonly)void (^ _Nullable updateInterval)(float timeInerval);


-(void)stop;


@end
