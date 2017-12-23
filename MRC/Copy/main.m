//
//  main.m
//  Copy
//
//  Created by J on 2017/12/20.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
void copy1(){
    NSArray *array1 = @[@(1),@(2)];
    NSLog(@"array1 retainCount = %lu  array1 = addr == %p",array1.retainCount,array1);

    NSArray *array2 = [array1 copy];
    NSLog(@"array1 retainCount = %lu  array1 = addr == %p",array1.retainCount,array1);

    NSLog(@"array2 retainCount = %lu  array2 = addr == %p",array2.retainCount,array2);
}
void copy2(){
    
    NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@(1),@(2), nil];
    NSLog(@"array1 retainCount = %lu  array1 = addr == %p",array1.retainCount,array1);
    
    NSArray *array2 = [array1 copy];
    NSLog(@"array1 retainCount = %lu  array1 = addr == %p",array1.retainCount,array1);
    
    NSLog(@"array2 retainCount = %lu  array2 = addr == %p",array2.retainCount,array2);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        copy1();
    }
    return 0;
}
