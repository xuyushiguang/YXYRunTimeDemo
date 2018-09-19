//
//  YXYTest.m
//  YXYRunTimeDemo
//
//  Created by LiuGen on 2018/9/19.
//  Copyright © 2018年 Test. All rights reserved.
//

#import "YXYTest.h"

@implementation YXYTest

-(void)addCount:(int)ct
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

-(void)takeNumber
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

+(void)share
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}

@end
