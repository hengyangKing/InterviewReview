//
//  main.m
//  循环Retain
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"
int main(int argc, const char * argv[]) {
    Person *man = [[Person alloc]init];
    Dog *dog = [[Dog alloc]init];
    man.dog = dog;
    dog.owner = man;
    
    [man release];
    [dog release];
    return 0;
}
