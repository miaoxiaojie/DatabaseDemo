//
//  FMDBAppUpgradeDBHelperInterface.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/15.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FMDBAppUpgradeDBHelperInterface <NSObject>

@optional
/**
 *  获取db中的版本信息
 *
 */
- (NSString *)getAppVersionInfo;

/**
 *  更新版本信息
 *
 */
- (BOOL)upgradeAppVersion:(NSString *)aVersion;


@end

NS_ASSUME_NONNULL_END
