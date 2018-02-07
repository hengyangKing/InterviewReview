//
//  BaseView.m
//  testPoint
//
//  Created by J on 2018/1/15.
//  Copyright © 2018年 J. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    //判断是否响应事件
    if (self.userInteractionEnabled == NO ||self.hidden == YES ||self.alpha <0.01) {
        return nil;
    }
    //判断点是否响应
    if ([self pointInside:point withEvent:event] == NO) {
        return nil;
    }
    
    NSInteger count = self.subviews.count;
    for (NSInteger i = (count -1); i>=0; i--) {
        //从后向前遍历
        UIView *childView = (UIView *)self.subviews[i];
        //转换座标系
        CGPoint childPoint = [self convertPoint:point toView:childView];
        
        //递归调用
        UIView *targetView = [childView hitTest:childPoint withEvent:event];
        if (targetView) {
            return targetView;
        }
        
    }
    //遍历循环结束 并没有return view 那么自己就是最合适的view
    return self;
}
@end
