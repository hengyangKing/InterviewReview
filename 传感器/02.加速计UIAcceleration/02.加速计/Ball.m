//
//  Ball.m
//  02.加速计
//
//  Created by J on 2017/12/11.
//  Copyright © 2017年 J. All rights reserved.
//

#import "Ball.h"
#define BALLSIZE self.frame.size
#define WINDOWSIZE [UIScreen mainScreen].bounds.size

@interface Ball()
@property(nonatomic,assign)CGPoint velocity;

@end

@implementation Ball

-(void (^)(UIAcceleration *))Acceleration
{
    //计算小球的速度（对象的结构体内部的属性是不能直接赋值的）需要对其成员变量进行赋值
    return ^(UIAcceleration *accele){
        _velocity.x += accele.x;
        _velocity.y += accele.y;
        
        if (_velocity.x<=0) {
            _velocity.x = 1;
            _velocity.x *= -0.6;
        }
        if (_velocity.x>=WINDOWSIZE.width-BALLSIZE.width){
            _velocity.x = (WINDOWSIZE.width-BALLSIZE.width-1);
            _velocity.x *= -0.6;
        }
        if (_velocity.y<=0){
            _velocity.y = 1;
            _velocity.y *= -0.6;
        }
        if (_velocity.y>=(WINDOWSIZE.height-BALLSIZE.height)){
            _velocity.y = (WINDOWSIZE.height-BALLSIZE.height-1);
            _velocity.y *= -0.6;
        }
        CGRect ballFrame =self.frame;
        ballFrame.origin.x = _velocity.x;
        ballFrame.origin.y = _velocity.y;
        self.frame =ballFrame;
    };
}
@end
