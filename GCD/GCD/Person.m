//
//  Person.m
//  GCD
//
//  Created by J on 2017/12/7.
//  Copyright © 2017年 J. All rights reserved.
//

#import "Person.h"
@interface Person()<NSCopying,NSMutableCopying>
@end
@implementation Person
static Person *_person;
+(instancetype)sharePerson{
    return [[[self class] alloc]init];
}
-(instancetype)init {
    if (!_person) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _person = [super init];
        });
    }
    return _person;
}
+(instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _person = [super allocWithZone:zone];
    });
    return _person;
}
-(id)copyWithZone:(NSZone *)zone {
    return _person;
}
-(id)mutableCopyWithZone:(NSZone *)zone{
    return _person;
}

@end
