//
//  main.m
//  NSString
//
//  Created by J on 2017/12/19.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //字符串常量 保存在字符串常量池 在内存数据区
        //如果你需要的字符串在常量池中已经存在，不会分配内存空间
        //常量区的对象引用计数为无符号最大值
        NSString *str1 = @"123";
        //类似于XXXString这种方式初始化的字符串 XCode会对其进行处理 结果该指针同样会指向常量区
        NSString *str2 = [NSString stringWithString:@"123"];//常量区
        NSString *str5 = [[NSString alloc]initWithString:@"123"];//常量区

        
        NSString *str3 = [NSString stringWithFormat:@"%@",@"123"];//堆区 类方法系统封装autorelease
        NSString *str4 = [[NSString alloc]initWithFormat:@"123"];//堆区 需要自己release
        
        NSLog(@"str1 = %@ %p",str1,str1);
        NSLog(@"str2 = %@ %p",str2,str2);
        NSLog(@"str5 = %@ %p",str5,str5);

        NSLog(@"str3 = %@ %p",str3,str3);
        NSLog(@"str4 = %@ %p",str4,str4);

    }
    return 0;
}
