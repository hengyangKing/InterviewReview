//
//  SellTicket.m
//  NSThread
//
//  Created by J on 2017/12/6.
//  Copyright © 2017年 J. All rights reserved.
//

#import "SellTicket.h"
@interface SellTicket()
{
    NSUInteger _ticketCount;
}
@property(nonatomic,strong)NSMutableArray<NSThread *> *sellers;

@end
@implementation SellTicket
+(instancetype)sellTicketWithSeller:(NSUInteger)seller
{
    SellTicket *ticket = [[[self class] alloc]init];
    if (seller) {
        for (NSUInteger i = 0; i<seller; i++) {
            [ticket.sellers addObject:[ticket thread:i]];
        }
    }
    return ticket;
}
-(instancetype)init
{
    self = [super init];
    if (self) {
        _ticketCount = 100;
    }
    return self;
}
-(NSMutableArray *)sellers
{
    if (!_sellers) {
        _sellers = [NSMutableArray array];
    }
    return _sellers;
}
-(NSThread *)thread:(NSUInteger)num{
    
    NSThread *thread =  [[NSThread alloc]initWithTarget:self selector:@selector(SellTicket) object:nil];
    [thread  setName:[NSString stringWithFormat:@"售票员%@",@(num)]];
    return thread;
    
}
-(void)sell
{
    for (NSThread *thread in self.sellers) {
        [thread start];
    }
}
-(void)SellTicket
{
    while (1) {
        @synchronized(self){
            NSUInteger count = _ticketCount;
            if (count>0) {
                _ticketCount = count-1;
                NSLog(@"%@卖了一张票 还剩下%zd张",[NSThread currentThread].name,_ticketCount);
            }else{
                NSLog(@"售完");
                break;
            }
        }
    }
}
-(void)dealloc
{
    NSLog(@"%s",__func__);
}
@end

