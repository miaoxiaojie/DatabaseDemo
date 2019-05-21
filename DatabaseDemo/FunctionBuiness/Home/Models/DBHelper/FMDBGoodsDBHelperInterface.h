//
//  FMDBGoodsDBHelperInterface.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FMDBGoodsDBHelperInterface <NSObject>

@optional
/**
 数据

 @param aInfos 数据
 @return 是否成功
 */
- (BOOL)replaceGoodsListInfos:(NSArray <__kindof id<FMDBGoodsDBHelperInterface>>*)aInfos;
/**
 所有数据

 @return 数据
 */
- (NSArray<NSDictionary *>*)selectAllAdInfos;
/**
 *  删除全部数据
 *
 *  @return yes
 */
- (BOOL)deleteAllAdInfos;
/**
 *  删除数据
 *
 *  @return yes
 */
-(BOOL)deleteGoodsWithID:(NSString *)goodsID;
/**
 *  更新数据库
 *
 *  @return yes
 */
-(BOOL)updateGoodsWithID:(NSString *)goodsID
          withCollection:(NSString *)collection;
/**
 *  收藏的商品
 *
 *  @return 数据
 */
-(NSArray<NSDictionary *>*)selectInfosCollect;
/**
 *  插入一条数据
 *
 *
 */
-(BOOL)insertGoodsListInfos:(NSDictionary *)aInfos;
@end

NS_ASSUME_NONNULL_END
