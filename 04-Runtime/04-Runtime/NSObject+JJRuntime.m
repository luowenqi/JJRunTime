//
//  NSObject+HMRuntime.m
//  04-Runtime
//
//  Created by 罗文琦 on 2017/5/7.
//  Copyright © 2017年 罗文琦. All rights reserved.
//

#import "NSObject+JJRuntime.h"

#import <objc/runtime.h>

@implementation NSObject (JJRuntime)

/**
 获取属性列表
 */
- (NSArray *)getPropertyList
{
    NSMutableArray *propertyArr = [NSMutableArray array];
    unsigned int count = 0;
    
    //获取对象的属性列表  第一个参数：类对象  第二个参数：属性的数量
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    
    //遍历数字获取属性
    for (int i = 0; i < count; i++) {
        //获取属性列表中的属性
        objc_property_t property = propertyList[i];
        //获取属性名称
        const char *name = property_getName(property);
        //c字符串转OC字符串
        NSString *nameStr = [NSString stringWithUTF8String:name];
        
        [propertyArr addObject:nameStr];
    }
    
    return [propertyArr copy];
}

/**
 获取属性以及对应值的列表
 */
- (NSDictionary *)getPropertyAndValueList
{
    NSMutableDictionary *propertyDic = [NSMutableDictionary dictionary];
    unsigned int count = 0;
    
    //获取对象的属性列表  第一个参数：类对象  第二个参数：属性的数量
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    
    //遍历数字获取属性
    for (int i = 0; i < count; i++) {
        //获取属性列表中的属性
        objc_property_t property = propertyList[i];
        //获取属性名称
        const char *name = property_getName(property);
        //c字符串转OC字符串
        NSString *nameStr = [NSString stringWithUTF8String:name];
        
        [propertyDic setValue:[self valueForKey:nameStr] forKey:nameStr];
    }
    
    return [propertyDic copy];
}


/**
 获取方法的列表
 */
- (NSArray *)getMethodList{
    NSMutableArray *methodArr = [NSMutableArray array];
    unsigned int count = 0;

    //获取对象的方法列表  第一个参数：类对象  第二个参数：方法的数量
    Method *methodList = class_copyMethodList([self class], &count);
    
    //遍历数字获取方法
    for (int i = 0; i < count; i++) {
        //获取方法列表中的方法
        Method method = methodList[i];
        //获取方法名称
        SEL sel = method_getName(method);
        NSString *methodStr = NSStringFromSelector(sel);
        //获取方法编码方式
        const char *encode = method_getTypeEncoding(method);
        NSLog(@"%s",encode);
        
        
        [methodArr addObject:methodStr];
    }
    
    return [methodArr copy];
}

@end
