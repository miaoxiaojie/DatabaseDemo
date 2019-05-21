//
//  FMDBStartBaseModule.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/14.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDBStartBaseModuleInterface.h"

NS_ASSUME_NONNULL_BEGIN

/**
 自定义AppDelegate启动module都需要继承该类实现
 */
@interface FMDBStartBaseModule : NSObject<FMDBStartBaseModuleInterface>

@end

NS_ASSUME_NONNULL_END
