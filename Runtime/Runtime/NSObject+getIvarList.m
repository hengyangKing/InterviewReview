//
//  NSObject+getIvarList.m
//  Runtime
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import "NSObject+getIvarList.h"
#import <objc/runtime.h>
@implementation NSObject (getIvarList)
+(void)logIvarList{
    
    //遍历对象的属性
    unsigned int count = 0;
    //遍历所有的属性 返回成员变量
    
    Ivar *ivars = class_copyIvarList(self, &count);
    for (int i = 0; i<count; i++) {
        Ivar ivar = ivars[i];
        NSString *ivarName = @(ivar_getName(ivar));
        NSLog(@"%@",ivarName);
    }
    
}
@end
