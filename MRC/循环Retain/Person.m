//
//  Person.m
//  循环Retain
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import "Person.h"
#import "Dog.h"
@implementation Person

-(void)dealloc
{
    [_dog release];
    NSLog(@"%s",__func__);
    [super dealloc];
}
@end
