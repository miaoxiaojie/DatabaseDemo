//
//  FMDBGoodsDBHelper.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMDBGoodsDBHelper.h"
#import "FMDBBaseServiceQueueInterface.h"
#import "FMDBUtil.h"
#import "FMDBBaseServiceInterface.h"

static NSString *const kGoodsReplaceSql = @"replace into GOODS_LIST('id','name','picture','price','collection','goodsdescribe') values (?,?,?,?,?,?)";
static NSString *const kAdSelectAllSql = @"select * from GOODS_LIST";

static NSString *const kAdDeleteAllSql = @"delete from GOODS_LIST";
//删除商品
static NSString *const kDeleteWithIDSql = @"delete from GOODS_LIST where id = ?";
//更改数据库的字段
static NSString *const KUpdateSql = @"update GOODS_LIST set collection  = ? where id = ?";
//查找收藏
static NSString *const kCollectSelectSql = @"select * from GOODS_LIST where collection = 1";
//插入一条数据
static NSString *const kInsertSql = @"insert into GOODS_LIST('id','name','picture','price','collection','goodsdescribe') values (?,?,?,?,?,?)";


@interface FMDBGoodsDBHelper ()

@property (strong,nonatomic) id<FMDBBaseServiceQueueInterface> dbQueue;


@end

@implementation FMDBGoodsDBHelper

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _dbQueue = [FMDBUtil getSqlWrapperQueue];
    }
    return self;
}

- (BOOL)replaceGoodsListInfos:(NSArray <__kindof id<FMDBGoodsDBHelperInterface>>*)aInfos
{
    __block BOOL result = NO;
    __weak __typeof(&*self)weakSelf = self;
    
    [self.dbQueue inTransaction:^(id<FMDBBaseServiceInterface>  _Nonnull dbServer, BOOL * _Nonnull rollback) {
        
        for (NSDictionary *dict in aInfos) {
            NSArray *args = [weakSelf p_getReplaceArgs:dict];
            result = [dbServer executeNonQuery:kGoodsReplaceSql
                                     arguments:args];
            if (!result) {
                *rollback = YES;
                break;
            }
            
        }
        
        
    }];
    
    return YES;
}

- (NSArray<NSDictionary *>*)selectAllAdInfos
{
    __block NSArray *result = [NSArray array];
    [self.dbQueue inDatabase:^(id<FMDBBaseServiceInterface> dbServer) {
        
       result = [dbServer executeQuery:kAdSelectAllSql arguments:nil];
       
    }];
    return result;
}

- (BOOL)deleteAllAdInfos
{
    __block BOOL result = NO;
    [self.dbQueue inDatabase:^(id<FMDBBaseServiceInterface> dbServer) {
        
        result = [dbServer executeNonQuery:kAdDeleteAllSql
                                 arguments:nil];
        
    }];
    return result;
}

-(BOOL)deleteGoodsWithID:(NSString *)goodsID
{
    __block BOOL result = NO;
    [self.dbQueue inDatabase:^(id<FMDBBaseServiceInterface> dbServer) {
        
        NSArray *args = @[goodsID];
        result = [dbServer executeNonQuery:kDeleteWithIDSql
                                 arguments:args];
    }];
    return result;
}

-(BOOL)updateGoodsWithID:(NSString *)goodsID
          withCollection:(NSString *)collection
{
    __block BOOL result = NO;
    [self.dbQueue inDatabase:^(id<FMDBBaseServiceInterface> dbServer) {
        
        NSArray *args = @[collection,goodsID];
        result = [dbServer executeNonQuery:KUpdateSql
                                 arguments:args];
    }];
    return result;
}

-(NSArray<NSDictionary *>*)selectInfosCollect
{
   
    __block NSArray *result = [NSArray array];
    [self.dbQueue inDatabase:^(id<FMDBBaseServiceInterface> dbServer) {
       
        result = [dbServer executeQuery:kCollectSelectSql arguments:nil];
        
    }];
    return result;
    
}

-(BOOL)insertGoodsListInfos:(NSDictionary *)aInfos
{
    __block BOOL result = NO;
    __weak __typeof(&*self)weakSelf = self;
    [self.dbQueue inDatabase:^(id<FMDBBaseServiceInterface> dbServer) {
        NSArray *args = [weakSelf p_getReplaceArgs:aInfos];
      
        result = [dbServer executeNonQuery:kInsertSql
                                 arguments:args];
    }];
    return result;
}

-(NSArray *)p_getReplaceArgs:(NSDictionary *)dict{
    
    NSArray *args = @[[dict objectForKey:@"id"],
                      [dict objectForKey:@"name"],
                      [dict objectForKey:@"picture"],
                      [dict objectForKey:@"price"],
                      [dict objectForKey:@"collection"],
                      [dict objectForKey:@"goodsdescribe"]];
    return args;
}

@end
