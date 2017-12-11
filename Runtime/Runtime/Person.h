//
//  Person.h
//  Runtime
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int a;
    int b;
}
@property(nonatomic,strong)NSDictionary *dic;
@property(nonatomic,strong)NSMutableArray *arr;
-(void)eat;
-(void)run;
+(void)sleep;
-(void)logNumber:(int)num1 andNumber2:(int)num2;
@end
