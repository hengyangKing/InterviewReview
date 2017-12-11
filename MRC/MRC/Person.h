//
//  Person.h
//  ARC
//
//  Created by J on 2017/12/5.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Room.h"
@interface Person : NSObject
{
    Room *_room;
}
-(void)setRoom:(Room *)room;
-(Room *)room;
@end
