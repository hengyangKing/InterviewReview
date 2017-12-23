//
//  main.m
//  Copy
//
//  Created by J on 2017/12/19.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

void copy_str(){
    Person *p=[[Person alloc]init];
    
    NSMutableString *str1 = [NSMutableString stringWithFormat:@"123"];
    p.str1 = str1;
    p.str2 = str1;
    
    [str1 appendString:@"666"];
    NSLog(@"str1 = %@   %p",str1,str1);
    
    NSLog(@"%@   %p",p.str1,p.str1);
    NSLog(@"%@   %p",p.str2,p.str2);
    
    NSLog(@"%ld",0x100617f90-0x33323135);
}
void copy1(){
    NSArray *array = @[@(1),@(2),@(3),@(4),@(5)];
    NSArray *array2 =[array copy];
    NSLog(@"array ==== %p",array);
    NSLog(@"array2 ==== %p",array2);
    
}
void copy2(){
    NSMutableArray *a1 = [[NSMutableArray alloc]initWithObjects:@(1),@(2), nil];
    id a2 = [a1 copy];
    if ([a2 isKindOfClass:[NSArray class]]){
        NSLog(@"s2 isKindOfClass [NSArray class]");
    }
    if ([a2 isKindOfClass:[NSMutableArray class]]) {
        NSLog(@"s2 isKindOfClass [NSMutableArray class]");
    }
    
    NSLog(@"%@   %p",a1,a1);
    NSLog(@"%@   %p",a2,a2);
    
}
void copy3(){
    NSArray *a1 = @[@(1),@(2)];
    id a2 = [a1 mutableCopy];
    if ([a2 isKindOfClass:[NSArray class]]){
        NSLog(@"s2 isKindOfClass [NSArray class]");
    }
    if ([a2 isKindOfClass:[NSMutableArray class]]) {
        NSLog(@"s2 isKindOfClass [NSMutableArray class]");
    }
    
    NSLog(@"%@   %p",a1,a1);
    NSLog(@"%@   %p",a2,a2);
}
void copy4(){
    NSMutableArray *a1 = [NSMutableArray arrayWithObjects:@(1),@(2), nil];
    id a2 = [a1 mutableCopy];
    if ([a2 isKindOfClass:[NSArray class]]){
        NSLog(@"s2 isKindOfClass [NSArray class]");
    }
    if ([a2 isKindOfClass:[NSMutableArray class]]) {
        NSLog(@"s2 isKindOfClass [NSMutableArray class]");
    }
    NSLog(@"%@   %p",a1,a1);
    NSLog(@"%@   %p",a2,a2);
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        copy2();
    }
    return 0;
}
