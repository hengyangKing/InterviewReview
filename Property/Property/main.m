//
//  main.m
//  Property
//
//  Created by J on 2017/12/5.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    Person *man = [Person new];
    [man setAge:100];
    
    NSLog(@"age is %@ & _age is %@ & age is %@",@([man age]),@(man->_age),@(man->age));
    
    man.name = @"A";
    NSLog(@"name is %@ & %@",man.fooFunc,[man fooFunc]);
    
    id obj = [Person new];
    if ([obj isMemberOfClass:[Person class]]) {
        //isMemberOfClass 判断指定的对象是否是当前指定的类的实例
    }
    
    if ([obj isKindOfClass:[NSObject class]]) {
        //isKindOfClass 判断指定的对象是否是某一个类，或者是某一个类的子类
    }
    
    
    
}
