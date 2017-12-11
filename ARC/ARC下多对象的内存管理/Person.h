//
//  Person.h
//  ARC下多对象的内存管理
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Dog;
@class Room;
/*
 MRC中
 A对象想拥有B对象，就需要对B对象进行一次retain
 A对象不用B对象时，就需要堆B对象进行一次release
 通过@property 中retain 关键子可以 简写一次引用计数， 并且需要在dealloc时进行release
 */
/*
 ARC中
 A对象想拥有B对象，就需要用一个强指针指向对象
 A对象不用B对象时，什么都不需要做，编译器会自动帮我们
 */
@interface Person : NSObject
@property(nonatomic,strong)Dog *dog;


@end
