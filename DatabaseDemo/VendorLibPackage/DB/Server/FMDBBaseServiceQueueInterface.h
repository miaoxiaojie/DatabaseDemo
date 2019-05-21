//
//  FMDBBaseServiceQueueInterface.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol FMDBBaseServiceInterface;

NS_ASSUME_NONNULL_BEGIN

@protocol FMDBBaseServiceQueueInterface <NSObject>


/**
 默认处理

 @param block 不需耗时操作
 */
- (void)inDatabase:(void (^)(id<FMDBBaseServiceInterface>dbServer))block;

/**
 事务 处理

 @param block  大量数据写入处理方法
 */
- (void)inTransaction:(void (^)(id<FMDBBaseServiceInterface>dbServer, BOOL *rollback))block;


@end

NS_ASSUME_NONNULL_END
