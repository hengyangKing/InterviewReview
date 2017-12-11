//
//  Person.h
//  泛型
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pet.h"

/**
 声明该对象持有泛型 并用协变关键字描述该泛型类型
 */
@interface Person<__contravariant ObjectType> : NSObject

@property(nonatomic,strong)ObjectType pet;

@property(nonatomic,strong)NSMutableArray <NSString *>* datas;

@end
