//
//  Room.m
//  ARC
//
//  Created by J on 2017/12/5.
//  Copyright © 2017年 J. All rights reserved.
//

#import "Room.h"

@implementation Room

-(void)dealloc
{
    NSLog(@"%s   ..number is %@",__func__,@(self.number));
    [super dealloc];
}
@end
