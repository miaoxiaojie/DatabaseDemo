//
//  FMDBAppUpgradeFactory.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/15.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDBAppUpgradeDBHelperInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FMDBAppUpgradeFactory : NSObject<FMDBAppUpgradeDBHelperInterface>

+ (id<FMDBAppUpgradeDBHelperInterface>)getAppUpgradeDBHelper;

@end

NS_ASSUME_NONNULL_END
