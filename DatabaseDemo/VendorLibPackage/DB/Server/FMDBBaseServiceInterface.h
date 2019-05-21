//
//  FMDBBaseServiceInterface.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

///数据库操作，在主线程上处理数据库，如果数据量较大请使用事务模式或者使用FMDBBaseServiceQueue;

@protocol FMDBBaseServiceInterface <NSObject>

/**
 查找操作

 @param sql sql语句
 @param args 参数
 @return 查找到的数据
 */
- (NSArray *)executeQuery:(NSString *)sql arguments:(nullable NSArray *)args;

/**
 更新操作

 @param sql sql
 @param args 参数
 @return 是否成功
 */
- (BOOL)executeNonQuery:(NSString *)sql arguments:(nullable NSArray *)args;

#pragma mark - 事务处理
/**
 开始事务

 @return BOOL 是否成功
 */
- (BOOL)beginTransaction;

/**
 提交事务 事务操作完成后提交修改

 @return BOOL 是否成功
 */
- (BOOL)commit;

/**
 回滚 出现异常后回滚数据库操作

 @return BOOL 是否成功
 */
- (BOOL)rollback;

/**
 判断表是否存在

 @param tableName 表名称
 @return BOOL 是否存在
 */
- (BOOL)tableExists:(NSString*)tableName;

/**
 判断字段是否存在

 @param columnName 字段名称
 @param tableName 表名称
 @return BOOL 是否存在
 */
- (BOOL)columnExists:(NSString*)columnName inTableWithName:(NSString*)tableName;

/**
 验证SQL语句是否有效

 @param sql SQL语句
 @param error 回传错误信息
 @return 判断SQL是否有效
 */
- (BOOL)validateSQL:(NSString*)sql error:(NSError**)error;


@end

NS_ASSUME_NONNULL_END
