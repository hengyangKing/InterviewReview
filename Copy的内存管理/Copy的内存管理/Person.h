//
//  Person.h
//  Copy的内存管理
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic,copy)void (^myBlock)(void);
@end
