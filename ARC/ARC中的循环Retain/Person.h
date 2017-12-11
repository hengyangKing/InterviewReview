//
//  Person.h
//  ARC中的循环Retain
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Dog;
@interface Person : NSObject
@property(nonatomic,strong)Dog *dog;
@end
