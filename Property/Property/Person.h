//
//  Person.h
//  Property
//
//  Created by J on 2017/12/5.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    @public
    int _age;
    int age;
}
@property int age;
@property (getter=fooFunc) NSString *name;


@end
