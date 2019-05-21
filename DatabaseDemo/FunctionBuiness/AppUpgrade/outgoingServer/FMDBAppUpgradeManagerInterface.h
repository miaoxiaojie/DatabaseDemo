//
//  FMDBAppUpgradeManagerInterface.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/15.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FMDBAppUpgradeManagerInterface <NSObject>

@required
/**
 *  应用升级更新本地资源文件
 */
-(void)updateRescourceWhenUpgradeApp;

@end

NS_ASSUME_NONNULL_END
