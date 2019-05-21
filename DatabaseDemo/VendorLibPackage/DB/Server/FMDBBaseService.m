//
//  FMDBBaseService.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMDBBaseService.h"
#import "FMDB.h"

@interface FMDBBaseService ()

@property (strong) FMDatabase *database;

@end

@implementation FMDBBaseService

- (instancetype)initWithPath:(NSString *)path
{
    self = [super init];
    if (self) {
      
        
       self.database = [FMDatabase databaseWithPath:path];
        if (![self.database open]) {
#ifdef DEBUG
            NSLog(@">>>>>>>>sqlite文件打开失败,class:%@",NSStringFromClass(self.class));
#endif
        }
        else
        {
            //设置重试时间
            [self.database setMaxBusyRetryTimeInterval:0.5f];
        }
    }
    return self;
}

- (NSArray *)executeQuery:(NSString *)sql arguments:(nullable NSArray *)args
{
    FMResultSet *resultSet = [self.database executeQuery:sql withArgumentsInArray:args];
    NSMutableArray *result = [[NSMutableArray alloc] init];
    while ([resultSet next]) {
        [result addObject:[resultSet resultDictionary]];
    }
    if (resultSet != nil) {
         [resultSet close];
    }
    return result;
}

- (BOOL)executeNonQuery:(NSString *)sql arguments:(nullable NSArray *)args
{
    BOOL result = [self.database executeUpdate:sql withArgumentsInArray:args];
    return result;
}

- (BOOL)beginTransaction
{
    BOOL result = [self.database beginTransaction];
    return result;
}

- (BOOL)commit
{
    BOOL result = [self.database commit];
    return result;
}

- (BOOL)rollback
{
    BOOL result = [self.database rollback];
    return result;
}


- (BOOL)tableExists:(NSString*)tableName
{
    return [self.database tableExists:tableName];
}

- (BOOL)columnExists:(NSString*)columnName inTableWithName:(NSString*)tableName
{
    return [self.database columnExists:columnName inTableWithName:tableName];
}

- (BOOL)validateSQL:(NSString*)sql error:(NSError**)error
{
    return [self.database validateSQL:sql error:error];
}

@end
