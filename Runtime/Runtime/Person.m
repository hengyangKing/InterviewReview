//
//  Person.m
//  Runtime
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)eat{
    
    NSLog(@"吃");
    
}
-(void)run{
    NSLog(@"跑");
}
-(void)logNumber:(int)num1 andNumber2:(int)num2
{
    NSLog(@"%d",num1);
    NSLog(@"%d",num2);
}
@end
