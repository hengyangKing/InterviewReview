//
//  NSObject+getMethodList.m
//  Runtime
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import "NSObject+getMethodList.h"
#import <objc/runtime.h>
@implementation NSObject (getMethodList)
+(void)logMethodList{
    //遍历所有的属性 返回方法列表
    unsigned int count = 0;
    Method *methods = class_copyMethodList(self, &count);
    for (int i = 0; i<count; i++) {
        Method method = methods[i];
        NSString *sel=NSStringFromSelector(method_getName(method));
        NSLog(@"%@",sel);
    }
    
}
@end
