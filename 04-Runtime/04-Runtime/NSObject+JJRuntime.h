//
//  NSObject+HMRuntime.m
//  04-Runtime
//
//  Created by 罗文琦 on 2017/5/7.
//  Copyright © 2017年 罗文琦. All rights reserved.

#import <Foundation/Foundation.h>

@interface NSObject (JJRuntime)

/**
 获取属性列表
 */
- (NSArray *)getPropertyList;

/**
 获取属性以及对应值的列表
 */
- (NSDictionary *)getPropertyAndValueList;


/**
 获取方法的列表
 */
- (NSArray *)getMethodList;

@end
