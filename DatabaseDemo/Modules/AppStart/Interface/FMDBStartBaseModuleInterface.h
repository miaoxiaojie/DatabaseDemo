//
//  FMDBStartBaseModuleInterface.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/14.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FMDBStartBaseModuleInterface <NSObject>

/**
 *  事件处理完成,事件处理完成后需手动调用改方法
 */
- (void)finished;

/**
 *  获取BusinessID
 *
 *  @return NSString
 */
- (NSString *)businessID;

@end

NS_ASSUME_NONNULL_END
