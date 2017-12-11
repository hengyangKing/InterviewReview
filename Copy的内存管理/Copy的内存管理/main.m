//
//  main.m
//  Copy的内存管理
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
    __block NSMutableString *str =[NSMutableString stringWithString:@"123"];
//    int a = 100;
//    NSLog(@"%p",dog);
    NSLog(@"str---%p",str);
//    NSLog(@"a--%p",&a);

    void (^myBlock)(void) = ^(){
        
        [str  appendString:@"888"];

//        NSLog(@"%p",dog);
        NSLog(@"str---%p",str);
//        NSLog(@"a--%p",&a);
        NSLog(@"%@",str);
    };
    
    
//    [p setMyBlock:^{
//        NSLog(@"%p",dog);
//        NSLog(@"str---%p",str);
//
//    }];
//    p.myBlock();
    [str  appendString:@"456"];
    myBlock();
    [p release];
    [dog release];

    
    return 0;
}
