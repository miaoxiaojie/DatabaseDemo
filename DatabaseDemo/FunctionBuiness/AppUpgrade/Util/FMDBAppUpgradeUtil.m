//
//  FMDBAppUpgradeUtil.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/15.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMDBAppUpgradeUtil.h"
#import "FMDBFileUtil.h"
#import "FMDBAppInfoServer.h"
#import "FMDBAppUpgradeDBHelperInterface.h"
#import "FMDBAppUpgradeFactory.h"
#import "FMDBVersionConfig.h"
#import "FMDBFileUtil.h"

@implementation FMDBAppUpgradeUtil

static BOOL isAppUpdate(void)
{
    BOOL isUpdate = NO;
    NSString *storePath = appInfoServerUtil.getDBFilePath();
    if([FMDBFileUtil fileExistAtPath:storePath])
    {
        id<FMDBAppUpgradeDBHelperInterface>verSqlDBHelper = [FMDBAppUpgradeFactory getAppUpgradeDBHelper];
        NSString *sqlVersion = [verSqlDBHelper getAppVersionInfo];
        //数据库版本与程序版本不一致
        if (![sqlVersion isEqualToString:FMDBReleaseCurrentVersion])
        {
            isUpdate = YES;
        }
    }
    
    return isUpdate;
}

const struct FMDBAppUpgradeUtil appUpdateUtil = {
    .isAppUpdate = isAppUpdate
};


@end
