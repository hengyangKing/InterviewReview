//
//  main.m
//  ARC中的循环Retain
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"
int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc]init];
    Dog *dog = [[Dog alloc]init];
    p.dog =dog;
    dog.owner = p;
    
    
    
    return 0;
}
