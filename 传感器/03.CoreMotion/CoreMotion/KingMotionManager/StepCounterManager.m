//
//  StepCounterManager.m
//  CoreMotion
//
//  Created by J on 2017/12/11.
//  Copyright © 2017年 J. All rights reserved.
//

#import "StepCounterManager.h"
#import <CoreMotion/CoreMotion.h>
@interface StepCounterManager()
@property(nonatomic,strong)CMStepCounter *stepCounter;
@property(nonatomic,assign)NSUInteger step;
@end
@implementation StepCounterManager
-(CMStepCounter *)stepCounter
{
    if (!_stepCounter) {
        _stepCounter = [[CMStepCounter alloc]init];
        self.step = 10;
    }
    return _stepCounter;
    
}
-(void (^)(NSUInteger))UpdateOnStep
{
    return ^(NSUInteger step){
        if (step>0) {
            self.step = step;
        }
    };
}
-(BOOL)isAvailable
{
    return [CMStepCounter isStepCountingAvailable
            ];
}
-(void)startStepCountingUpdatesToQueue:(NSOperationQueue *)queue andHander:(void (^)(NSInteger numberOfSteps, NSDate * _Nonnull timestamp, NSError * _Nullable error))hander{
    //
    [self.stepCounter startStepCountingUpdatesToQueue:queue updateOn:self.step withHandler:hander];
}
@end
