//
//  Person+Test3.m
//  TestCategroy
//
//  Created by 王泽龙 on 2019/4/30.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "Person+Test3.h"
#import <objc/runtime.h>

@implementation Person (Test3)

#pragma mark 模拟category添加成员变量

// 方法一：
// 存在问题： 多个对象的时候，方法不可行
//int weight_;
//- (void)setWeight:(int)weight {
//    weight_ = weight;
//}
//
//- (int)weight {
//    return weight_;
//}

// 方法二：可变字典
// 存在问题：// 1、内存问题,全局的字典 2.线程安全问题（不同线程中对象，访问的时候，可能存在线程安全问题） 3每次增加一个属性，都会增加字典，很麻烦
//NSMutableDictionary *weights_;
//+ (void)load {
//    weights_ = [NSMutableDictionary dictionary];
//}
//
//- (void)setWeight:(int)weight {
//    NSString *key = [NSString stringWithFormat:@"%p", self];
//    weights_[key] = @(weight);
//}
//
//- (int)weight {
//    NSString *key = [NSString stringWithFormat:@"%p", self];
//    return [weights_[key] intValue];
//}

// 方法三：关联对象
static void *weightKey = &weightKey;// 存储自己地址，唯一性
- (void)setWeight:(int)weight {
    objc_setAssociatedObject(self, weightKey, @(weight), OBJC_ASSOCIATION_RETAIN);
}

- (int)weight {
    return [objc_getAssociatedObject(self, weightKey) intValue];
}
@end
