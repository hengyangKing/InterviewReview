//
//  main.m
//  ARC
//
//  Created by J on 2017/12/5.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Room.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [[Person alloc]init];
        Room *room1 = [[Room alloc]init];
        room1.number = 444;
        
        [p setRoom:room1];
        //换房间
        Room *room2 = [[Room alloc]init];
        room2.number = 888;
        [p setRoom:room2];

        
        [p release];
        [room1 release];
        [room2 release];
    }
    return 0;
}
