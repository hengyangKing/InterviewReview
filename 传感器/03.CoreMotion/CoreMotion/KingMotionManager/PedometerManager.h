//
//  PedometerManager.h
//  0.3加速计CoreMotion
//
//  Created by J on 2017/12/11.
//  Copyright © 2017年 J. All rights reserved.
//

#import "KingMotionManager.h"
//ios9之后计步器对象
@interface PedometerManager : KingMotionManager
//开始更新计步
-(void)startWithHander:(CMPedometerEventHandler)hander;

//从指定日期开始计步
-(void)startWithDate:(NSDate *)date andHander:(CMPedometerHandler)hander;

//查询从某日至今的所以行走数据
-(void)queryPedometerDataFromDate:(NSDate *)fromdate andHander:(CMPedometerHandler)hander;

@end
