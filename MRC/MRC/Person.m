//
//  Person.m
//  ARC
//
//  Created by J on 2017/12/5.
//  Copyright © 2017年 J. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)setRoom:(Room *)room
{
    if (![room isEqual:_room]) {
        if (_room) {
            [_room release];
        }
        [room retain];
        _room = room;
    }
}
-(Room *)room
{
    return _room;
}
-(void)dealloc
{
    NSLog(@"%s",__func__);
    [_room release];
    [super dealloc];
}
@end
