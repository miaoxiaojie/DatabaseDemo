//
//  FMDBUtil.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMDBUtil.h"
#import "FMDBBaseServiceQueue.h"
#import "FMDBAppInfoServer.h"
#import "FMDBBaseServiceFactory.h"

@implementation FMDBUtil

+ (id<FMDBBaseServiceQueueInterface>)getSqlWrapperQueue
{
    NSString *path = appInfoServerUtil.getDBFilePath();
    FMDBBaseServiceQueue *databaseQueue = [FMDBBaseServiceFactory getFMDBBaseServiceQueueWithPath:path];
    return databaseQueue;
}

@end
