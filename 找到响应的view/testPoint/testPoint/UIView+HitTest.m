//
//  UIView+HitTest.m
//  testPoint
//
//  Created by J on 2018/1/15.
//  Copyright © 2018年 J. All rights reserved.
//

#import "UIView+HitTest.h"

@implementation UIView (HitTest)
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (self.userInteractionEnabled == NO || self.hidden == YES || !self.alpha ) return nil;
    
    if (![self pointInside:point withEvent:event]) return nil;
    
    NSInteger count = self.subviews.count;

    for (NSInteger i = (count-1); i<=0; i--) {
        UIView *childView = self.subviews[i];
        CGPoint childPoint = [self convertPoint:point toView:childView];
       UIView *target = [childView hitTest:childPoint withEvent:event];
        if (target )return target;
    }
    //递归循环遍历完成 并没有返回target view 那么只能是自己是target
    return self;
}
@end
