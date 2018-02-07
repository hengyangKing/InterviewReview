//
//  main.m
//  __block
//
//  Created by J on 2017/12/26.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"1",@"2", nil];
        
        int a = 10;
        void (^fooBlock)(void)=^(){
            NSLog(@"%@",arr.lastObject);
            NSLog(@"%@",@(a));
        };
        [arr addObject:@"3"];
        arr = nil;
        a = 20;
        fooBlock();
        
    }
    return 0;
}
