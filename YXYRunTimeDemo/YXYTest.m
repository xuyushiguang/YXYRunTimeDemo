//
//  YXYTest.m
//  YXYRunTimeDemo
//
//  Created by LiuGen on 2018/9/19.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "YXYTest.h"

@implementation YXYTest

-(void)addCount
{
    NSLog(@"addCount");
}

-(void)takeNumber
{
    NSLog(@"takeNumber");
}

+(void)share
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

@end
