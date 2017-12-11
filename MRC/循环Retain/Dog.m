//
//  Dog.m
//  循环Retain
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import "Dog.h"
#import "Person.h"
@implementation Dog
-(void)dealloc
{
    [_owner release];
    NSLog(@"%s",__func__);
    [super dealloc];
}
@end
