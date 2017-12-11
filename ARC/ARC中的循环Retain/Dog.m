//
//  Dog.m
//  ARC中的循环Retain
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import "Dog.h"

@implementation Dog
-(void)setOwner:(Person *)owner
{
    _owner = owner;
    NSLog(@"%p",_owner);
}
-(void)dealloc{
    NSLog(@"%s",__func__);
}
@end
