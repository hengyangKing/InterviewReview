//
//  Person.m
//  Property
//
//  Created by J on 2017/12/5.
//  Copyright © 2017年 J. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)dealloc
{
    [self.room release];
    NSLog(@"%s",__func__);
    [super dealloc];
}

@end
