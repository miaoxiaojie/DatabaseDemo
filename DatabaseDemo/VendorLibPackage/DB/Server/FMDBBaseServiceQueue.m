//
//  FMDBBaseServiceQueue.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMDBBaseServiceQueue.h"
#import "FMDBBaseServiceInterface.h"
#import "FMDBBaseServiceFactory.h"
#import "FMDB.h"

static const void * const kDispatchQueueSpecificKey = &kDispatchQueueSpecificKey;

@interface FMDBBaseServiceQueue ()
{
    dispatch_queue_t _queue;
}

@property (strong) id<FMDBBaseServiceInterface> dbServer;

@end

@implementation FMDBBaseServiceQueue

- (instancetype)initWithPath:(NSString *)path
{
    self = [super init];
    if (self) {
        self.dbServer = [FMDBBaseServiceFactory getFMDBBaseServiceWithPath:path];
        //创建一个串行队列来执行数据库的所有操作
        _queue = dispatch_queue_create([[NSString stringWithFormat:@"SqlWrapperQueue.%@", self] UTF8String], NULL);
        //通过key标示队列，设置context为self
        dispatch_queue_set_specific(_queue, kDispatchQueueSpecificKey, (__bridge void *)self, NULL);
        
    }
    return self;
}


/**
 当要执行数据库操作时，如果在queue里面的block执行过程中，又调用了 indatabase方法，需要检查是不是同一个queue，因为同一个queue的话会产生死锁情况
 
 dispatch_queue_set_specific 防止死锁
 */
- (void)inDatabase:(void (^)(id<FMDBBaseServiceInterface>dbServer))block
{
    FMDBBaseServiceQueue *currentSyncQueue = (__bridge id)dispatch_get_specific(kDispatchQueueSpecificKey);
    assert(currentSyncQueue != self && "inDatabase: was called reentrantly on the same queue, which would lead to a deadlock");
    FMDBRetain(self);
    __block typeof(self)bself = self;
    dispatch_sync(_queue, ^() {
        
        block(bself.dbServer);
        
    });
    FMDBRelease(self);
}

- (void)inTransaction:(void (^)(id<FMDBBaseServiceInterface>dbServer, BOOL *rollback))block
{
    FMDBRetain(self);
    __block typeof(self)bself = self;
    dispatch_sync(_queue, ^() {
        
        BOOL shouldRollback = NO;
        //开启一个事物
        [bself.dbServer beginTransaction];
        
        @try {
             block(bself.dbServer,&shouldRollback);
        } @catch (NSException *exception) {
            //回滚事物
            if (shouldRollback) {
                [bself.dbServer rollback];
            }
            
        } @finally {
            if (!shouldRollback) {
                //重新提交事物
                [bself.dbServer commit];
                
            }
        }
        
    });
    FMDBRelease(self);
    
}

@end
