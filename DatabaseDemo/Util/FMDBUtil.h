//
//  FMDBUtil.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol FMDBBaseServiceQueueInterface;

NS_ASSUME_NONNULL_BEGIN

@interface FMDBUtil : NSObject

/**
 *  获取异步处理数据库引擎
 *
 *
 *  @return 数据库
 */
+ (id<FMDBBaseServiceQueueInterface>)getSqlWrapperQueue;

@end

NS_ASSUME_NONNULL_END
