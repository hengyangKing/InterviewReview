//
//  StepCounterManager.h
//  CoreMotion
//
//  Created by J on 2017/12/11.
//  Copyright © 2017年 J. All rights reserved.
//

#import "KingMotionManager.h"
//ios7-8计步器对象
@interface StepCounterManager : KingMotionManager
@property(nonatomic,copy,readonly)void (^UpdateOnStep)(NSUInteger updateOnStep);


@end
