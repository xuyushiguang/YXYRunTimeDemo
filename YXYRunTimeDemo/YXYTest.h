//
//  YXYTest.h
//  YXYRunTimeDemo
//
//  Created by LiuGen on 2018/9/19.
//  Copyright © 2018年 Test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXYTest : NSObject
{
    @public
    NSString *name;
    float height;
    
    @private
    NSString *password;
    int number;
}

@property(nonatomic,assign)int count;
@property(nonatomic,copy)NSString *address;

-(void)addCount;

-(void)takeNumber;

+(void)share;


@end
