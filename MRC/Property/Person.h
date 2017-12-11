//
//  Person.h
//  Property
//
//  Created by J on 2017/12/5.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Room.h"
@interface Person : NSObject

/**
 retain 修饰需要内存管理的对象
 */
@property(retain)Room *room;
@end
