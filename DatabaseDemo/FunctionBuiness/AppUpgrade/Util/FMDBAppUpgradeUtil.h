//
//  FMDBAppUpgradeUtil.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/15.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMDBAppUpgradeUtil : NSObject

extern const struct FMDBAppUpgradeUtil
{
    BOOL (*isAppUpdate)(void);
    
}appUpdateUtil;


@end

NS_ASSUME_NONNULL_END
