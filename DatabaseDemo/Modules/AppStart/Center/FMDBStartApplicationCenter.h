//
//  FMDBStartApplicationCenter.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/14.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>
@import Foundation;
@protocol FMDBStartModuleConfigInterface;

NS_ASSUME_NONNULL_BEGIN

/**
 *  APP启动项管理;单例
 */
@interface FMDBStartApplicationCenter : NSObject

/**
 *  单例
 *
 *  @return FMDBStartApplicationCenter
 */
+ (FMDBStartApplicationCenter *)sharedAppEventCenter;

/**
 *
 初始化所有的AppDelegate相关的Event Modules
 *
 */
- (BOOL)registedAllModules;

/**
 *  执行appDelegate事件
 *
 *  @param aSelName SEL name
 */
- (void)handleApplicationEvent:(NSString *)aSelName Complete:(void(^)(id module,SEL sel))complete;

/**
 *  清除完成Module
 *
 *  @param businessID Module的功能ID
 *
 */
- (void)removeFinishedModule:(NSString *)businessID;

@end

NS_ASSUME_NONNULL_END
