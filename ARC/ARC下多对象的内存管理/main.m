//
//  main.m
//  ARC下多对象的内存管理
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"
int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc]init];
    Dog *d = [[Dog alloc]init];
    p.dog = d;
    d = nil;
    return 0;
}
