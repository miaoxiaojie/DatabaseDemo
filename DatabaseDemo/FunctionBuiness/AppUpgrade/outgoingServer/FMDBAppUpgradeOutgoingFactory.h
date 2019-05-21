//
//  FMDBAppUpgradeOutgoingFactory.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/15.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol FMDBAppUpgradeManagerInterface;

NS_ASSUME_NONNULL_BEGIN

@interface FMDBAppUpgradeOutgoingFactory : NSObject

+ (id<FMDBAppUpgradeManagerInterface>)getAppUpgradeManager;

@end

NS_ASSUME_NONNULL_END
