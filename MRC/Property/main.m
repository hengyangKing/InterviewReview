//
//  main.m
//  Property
//
//  Created by J on 2017/12/5.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Room.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        Person *man = [[Person alloc]init];
        Room *room1 = [[Room alloc]init];
        room1.num = 444;
        man.room = room1;
        
        Room *room2 = [[Room alloc]init];
        room2.num = 666;
        man.room =room2;
        
        [man release];
        [room1 release];
        [room2 release];
        
        
        
    }
    return 0;
}
