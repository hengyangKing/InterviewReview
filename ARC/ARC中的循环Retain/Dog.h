//
//  Dog.h
//  ARC中的循环Retain
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  Person;
@interface Dog : NSObject
@property (nonatomic,weak)Person *owner;
@end
