//
//  FMDBHomeFactory.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol FMDBGoodsDBHelperInterface;

NS_ASSUME_NONNULL_BEGIN

@interface FMDBHomeFactory : NSObject

+ (id<FMDBGoodsDBHelperInterface>)getGoodsListDBHelper;
+(id<FMDBGoodsDBHelperInterface>)getCityDBHelper;

@end

NS_ASSUME_NONNULL_END
