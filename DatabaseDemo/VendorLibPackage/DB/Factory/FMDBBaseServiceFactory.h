//
//  FMDBBaseServiceFactory.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/10.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol FMDBBaseServiceInterface;
@protocol FMDBBaseServiceQueueInterface;

NS_ASSUME_NONNULL_BEGIN

@interface FMDBBaseServiceFactory : NSObject

+(id<FMDBBaseServiceInterface>)getFMDBBaseServiceWithPath:(NSString *)path;
+(id<FMDBBaseServiceQueueInterface>)getFMDBBaseServiceQueueWithPath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
