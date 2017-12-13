//
//  KingMotionManager.m
//  0.3加速计CoreMotion
//
//  Created by J on 2017/12/11.
//  Copyright © 2017年 J. All rights reserved.
//

#import "KingMotionManager.h"
#import <objc/runtime.h>
@interface KingMotionManager()<NSCopying,NSMutableCopying>
@end
@implementation KingMotionManager
//可继承单例是指父类中写下单例创建的方法, 当其本身类或其子类调用父类中的类创建的方法时, 可以各自类创建各自类的单例. 所以, 在父类中写的一个方法, 同时适用于其本身和其子类, 故称作可继承单例.

+(instancetype _Nonnull )sharedInstance {
    id _instance = objc_getAssociatedObject(self, @"instance");
    if (!_instance){
        _instance = [[super allocWithZone:NULL] init];
        objc_setAssociatedObject(self, @"instance", _instance, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return _instance;
}
+(id) allocWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance] ;
}
-(id) copyWithZone:(struct _NSZone *)zone
{
    Class selfClass = [self class];
    return [selfClass sharedInstance] ;
}

- (nonnull id)mutableCopyWithZone:(nullable NSZone *)zone {
    Class selfClass = [self class];
    return [selfClass sharedInstance] ;
}

@end
