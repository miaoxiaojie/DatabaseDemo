//
//  FMDBCityDBHelper.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/16.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMDBCityDBHelper.h"
#import "FMDBBaseServiceQueueInterface.h"
#import "FMDBUtil.h"
#import "FMDBBaseServiceInterface.h"

static NSString *const kSelectAllCitySql = @"select * from CITY";

@interface FMDBCityDBHelper ()

@property (strong,nonatomic) id<FMDBBaseServiceQueueInterface> dbQueue;


@end

@implementation FMDBCityDBHelper

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _dbQueue = [FMDBUtil getSqlWrapperQueue];
    }
    return self;
}

- (NSArray<NSDictionary *>*)selectAllAdInfos
{
    __block NSArray *result = [NSArray array];
    [self.dbQueue inDatabase:^(id<FMDBBaseServiceInterface> dbServer) {
        
        result = [dbServer executeQuery:kSelectAllCitySql arguments:nil];
        
    }];
    return result;
}

@end
