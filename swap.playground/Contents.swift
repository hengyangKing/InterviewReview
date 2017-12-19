//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//中间变量
func swap1( num1:inout Int, num2:inout Int) {
    
    let temp = num1
    num1 = num2
    num2 = temp
}
//无中间变量交换1
func swap2(num1:inout Int,num2: inout Int) {
    num1 = num1 + num2
    num2 = num1 - num2
    num1 = num1 - num2
}
//无中间变量交换2
func swap3(num1:inout Int,num2: inout Int) {
    // 相异为1 相同为0
    num1 = num1 ^ num2
    num2 = num1 ^ num2
    //==>  num2 = num1 ^ num2 ^ num2  ==> num2 被抵消
    num1 = num1 ^ num2
    //==>  num1 = num1 ^ num1 ^ num2   ==> num1 被抵消
}

var a = 20 , b = 30
swap3(num1: &a,num2: &b);
a
b



