//
//  main.m
//  NSThread
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Test.h"
#import "SellTicket.h"
int main(int argc, const char * argv[]) {
//    [[[Test alloc]init]createThread2];
    SellTicket *s = [SellTicket sellTicketWithSeller:5];
    [s sell];
    NSLog(@"-----");
    return 0;
}
