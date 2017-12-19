//
//  main.m
//  指针
//
//  Created by J on 2017/12/19.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>

//指针的类型和长度
void point1(void){
    int array[4] = {1,2,3,4};
    //        32位系统中 int 类型4字节 64位中 8字节
    int *p1 = array;//指向数组首元素的指针，指向4字节的空间
    int (*p2)[4] = &array;//指向数组的指针，指向16字节的空间    0x7ffeefbff620-0x7ffeefbff614
    NSLog(@"%p %p",p1,p2);
    NSLog(@"%lu %lu",sizeof(p1),sizeof(p2));
    NSLog(@"%p %p",p1+1,p2+1);
    NSLog(@"%p %p",array+1,&array+1);
}
//指针的类型强转
void point2(void){
    int array[4] = {1,2,3,4};
    int *p = (int *)(&array +1);
    /**
     1.(&array +1)其中&array 指向数组的指针 +1跨度为16
     2.(int *)将其强转为 int 型指针 跨度为 4 并赋值给int *p
     3.*(p-1) 反方向跨度为4
     */
    NSLog(@"%d",*(p-1));
}
//二维数组的指针强转
void point3(void) {
    int a[2][3] = {{1,2,3},{4,5,6}};
//    a[0]==>a[0][0]的地址 指向a[0][0]元素的指针，既指向4字节空间
//    a[1]==>a[1][0]的地址 指向a[1][0]元素的指针，既指向4字节空间
//    a ==> a[0]的地址，指向a[0]的指针，指向12字节的空间
//    &a==> a的地址，指向a的指针，指向24个字节的空间
    int *p = (int *)(a+1);
    NSLog(@"%d",*(p-2));
    int *p1 = (int *)(a[0]+1);
    NSLog(@"%d",*p1);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        point3();


    }
    return 0;
}

