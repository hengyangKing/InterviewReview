//
//  Ball.h
//  02.加速计
//
//  Created by J on 2017/12/11.
//  Copyright © 2017年 J. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Ball : UIImageView
@property(nonatomic,copy,readonly)void (^Acceleration)(UIAcceleration *acceleration);

@end
