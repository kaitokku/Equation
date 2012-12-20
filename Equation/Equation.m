//
//  Equation.m
//  Equation
//
//  Created by 山崎 進 on 2012/12/12.
//  Copyright (c) 2012年 zacky1972. All rights reserved.
//

#import "Equation.h"

@implementation Equation

@synthesize a,b,c;

- (id)initWithA:(double)_a b:(double)_b c:(double)_c
{
    self = [super init];
    if(self != nil) {
        a = _a;
        b = _b;
        c = _c;
    }
    return self;
}

// 判別式 discriminant
- (double)discriminant
{
    return b * b - 4 * a * c;
}

// 実数解ならば true を返す
- (BOOL)isReal
{
    return [self discriminant] >= 0;
}

- (double)real1
{
    //一次式ならば解の方程式を用いない
    if(a==0){
        return [self FirstExpression];
    }
    else if([self isReal]) {
        return (-b + sqrt([self discriminant]))/(2*a);
    }
    return (-b)/(2*a);
}

- (double)real2
{
    //一次式ならば解の方程式を用いない
    if(a==0){
        return [self FirstExpression];
    }
    else if([self isReal]) {
        return (-b - sqrt([self discriminant]))/(2*a);
    }
    return (-b)/(2*a);
}


- (double)imaginary1
{
    //一次式の場合も0を返す
    if(a==0 || [self isReal]) {
        return 0;
    }
    return (sqrt(-[self discriminant]))/(2*a);
}

- (double)imaginary2
{
    //一次式の場合も0を返す
    if(a==0 || [self isReal]) {
        return 0;
    }
    return -(sqrt(-[self discriminant]))/(2*a);
}

//式が１次式ならば他のスレッドの代わりに実数解を返す
- (double)FirstExpression{
    if(b==0){
        return NAN; //0次式の場合はNANを返す
    }
    return -c/b;
}

@end
