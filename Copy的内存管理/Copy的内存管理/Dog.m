//
//  Dog.m
//  Copy的内存管理
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import "Dog.h"

@implementation Dog
-(void)dealloc
{
    NSLog(@"%s",__func__);
    [super dealloc];
}
@end
