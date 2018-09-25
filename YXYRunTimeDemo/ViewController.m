//
//  ViewController.m
//  YXYRunTimeDemo
//
//  Created by LiuGen on 2018/9/19.
//  Copyright © 2018年 Test. All rights reserved.
//
/**
 c
 A char
 i
 An int
 s
 A short
 l
 A long
 l is treated as a 32-bit quantity on 64-bit programs.
 q
 A long long
 C
 An unsigned char
 I
 An unsigned int
 S
 An unsigned short
 L
 An unsigned long
 Q
 An unsigned long long
 f
 A float
 d
 A double
 B
 A C++ bool or a C99 _Bool
 v
 A void
 *
 A character string (char *)
 @
 An object (whether statically typed or typed id)
 #
 A class object (Class)
 :
 A method selector (SEL)
 [array type]
 An array
 {name=type...}
 A structure
 (name=type...)
 A union
 bnum
 A bit field of num bits
 ^type
 A pointer to type
 ?
 An unknown type (among other things, this code is used for function pointers)
 
 */
#import "ViewController.h"
#import "YXYTest.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController
/**
 关于class_addMethod(...)这个函数的解释
 cls:要添加函数的目标类，
 sel：要添加的函数名，可以随意，但是参数必须和第三个参数所表示的函数保持一致
 imp：实现函数的指针，也即是sel函数的实现函数，可以在任何地方实现，但是必须能找到这个指针imp
 types参数解释:"v@:";v表示方法返回值是void，第一个@表示self，第二个：表示SEL，其他符号在这个文件上面已列出，也可以去下面这个网址查看
 苹果文档协定https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
 BOOL class_addMethod(Class _Nullable cls, SEL _Nonnull name, IMP _Nonnull imp, const char * _Nullable types)
 **/
-(void)seeHello
{
//    NSLog(@"seehello: %@",NSStringFromSelector(_cmd));
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self getPropertyLists];
//    [self getIvarLists];
//    [self getInstanceMethodList];
//    [self getClassMethodList];
    
    //动态添加方法,上面有解释
//   Method impMe = class_getInstanceMethod([self class], @selector(seeHello));
//   class_addMethod([YXYTest class], @selector(hello), method_getImplementation(impMe), "v@:");
//    YXYTest *te = [YXYTest new];
//    [te performSelector:@selector(hello)];
//    //方法交换
//   Method origin = class_getInstanceMethod([YXYTest class], @selector(addCount));
//    Method swizz = class_getInstanceMethod([YXYTest class], @selector(takeNumber));
//    method_exchangeImplementations(origin, swizz);
//    [te addCount];
//    [te takeNumber];
}
/**
 log:
 Property:count
 Property:address
 **/
-(void)getPropertyLists
{
    //属性个数
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([YXYTest class], &count);
    
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        NSString *nameStr = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
//        NSLog(@"Property:%@", nameStr);
    }
    free(properties);
    
}
/**
 log:
 ivarName:name
 ivarName:height
 ivarName:password
 ivarName:number
 ivarName:_count
 ivarName:_address
 **/
//获取类的成员变量
- (void)getIvarLists {
    unsigned int count;
    Ivar *ivarList = class_copyIvarList([YXYTest class], &count);
    for (int i = 0; i < count; i++) {
        NSString *nameStr = [NSString stringWithUTF8String:ivar_getName(ivarList[i])];
//        NSLog(@"ivarName:%@", nameStr);
    }
    free(ivarList);
   
}
/**
 log:
 InstanceMethod:takeNumber
 InstanceMethod:addCount:
 InstanceMethod:setAddress:
 InstanceMethod:count
 InstanceMethod:.cxx_destruct
 InstanceMethod:setCount:
 InstanceMethod:address
 **/
//获取一个类的实例方法列表
- (void)getInstanceMethodList {
    unsigned int count;
    Method *methods = class_copyMethodList([YXYTest class], &count);
    for (int i = 0; i < count; i++) {
        SEL name = method_getName(methods[i]);
//        NSLog(@"InstanceMethod:%@", NSStringFromSelector(name));
    }
    free(methods);
}
/**
 log:
 ClassMethod:share
 **/
//获取一个类的类方法列表
- (void)getClassMethodList {
    unsigned int count;
    Method *methods = class_copyMethodList(object_getClass([YXYTest class]), &count);
    for (int i = 0; i < count; i++) {
        SEL name = method_getName(methods[i]);
//        NSLog(@"ClassMethod:%@", NSStringFromSelector(name));
    }
    free(methods);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
