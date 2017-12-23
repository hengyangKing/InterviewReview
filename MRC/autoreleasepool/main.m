//
//  main.m
//  autoreleasepool
//
//  Created by J on 2017/12/19.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [Person new];
        @autoreleasepool {
            //1
            @autoreleasepool {
                //2
                
                [p autorelease];
                @autoreleasepool {
                    //3
                    //栈顶
                }
            }
        }
    }
    return 0;
}
