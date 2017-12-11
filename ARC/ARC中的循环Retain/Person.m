//
//  Person.m
//  ARC中的循环Retain
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)dealloc{
    NSLog(@"%s",__func__);
}
@end
