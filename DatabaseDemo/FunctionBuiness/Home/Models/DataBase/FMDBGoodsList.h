//
//  FMDBGoodsList.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMDBGoodsList : NSObject

/**
 商品数据

 @return 商品
 */
+(NSArray<NSDictionary *> *)getGoodsList;

/**
 添加商品

 @return 商品
 */
+(NSDictionary *)getInsertDict;

@end

NS_ASSUME_NONNULL_END
