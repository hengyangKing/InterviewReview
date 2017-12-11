//
//  main.m
//  Runtime
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import <objc/message.h>
#import "NSObject+getIvarList.h"
#import "NSObject+getMethodList.h"
int main(int argc, const char * argv[]) {
    Person *p = [[Person alloc]init];
    objc_msgSend(p, @selector(eat));
    objc_msgSend(p, @selector(run));

//    objc_msgSend(p, @selector(logNumber:andNumber2:),100,22);

//    objc_msgSend([Person class], @selector(sleep));
//    [Person logIvarList];
//    [Person logMethodList];
    

}
