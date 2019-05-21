//
//  FMDBBaseServiceFactory.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/10.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMDBBaseServiceFactory.h"
#import "FMDBBaseService.h"
#import "FMDBBaseServiceQueue.h"

@implementation FMDBBaseServiceFactory

+(id<FMDBBaseServiceInterface>)getFMDBBaseServiceWithPath:(NSString *)path
{
    FMDBBaseService *baseService = [[FMDBBaseService alloc]initWithPath:path];
    return baseService;
}

+(id<FMDBBaseServiceQueueInterface>)getFMDBBaseServiceQueueWithPath:(NSString *)path
{
    FMDBBaseServiceQueue *serviceQueue = [[FMDBBaseServiceQueue alloc]initWithPath:path];
    return serviceQueue;
}

@end
