//
//  Person+MethodSwizzling.m
//  Runtime
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import "Person+MethodSwizzling.h"
#import <objc/runtime.h>
@implementation Person (MethodSwizzling)
+(void)load
{
    Method func1 = class_getInstanceMethod([self class], @selector(run));
    
    
    Method func2 = class_getInstanceMethod([self class], @selector(eat));
    
    method_exchangeImplementations(func1, func2);
    
}
@end
