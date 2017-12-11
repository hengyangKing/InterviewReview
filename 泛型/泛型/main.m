//
//  main.m
//  泛型
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"
int main(int argc, const char * argv[]) {
    Person<Dog *> *p1 = [[Person alloc]init];
    
    Person<Pet *> *p2 = [[Person alloc]init];
    
    p1 = p2;
    
    
    
    
    
    return 0;
}
