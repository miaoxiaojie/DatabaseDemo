//
//  FMDBAppUpgradeManager.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/15.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMDBAppUpgradeManager.h"
#import "FMDBAppUpgradeUtil.h"
#import "FMDBFileUtil.h"
#import "FMDBAppInfoServer.h"
#import "FMDBAppUpgradeDBHelperInterface.h"
#import "FMDBAppUpgradeFactory.h"
#import "FMDBVersionConfig.h"

@implementation FMDBAppUpgradeManager

-(void)updateRescourceWhenUpgradeApp
{
    BOOL isAppUpdate = appUpdateUtil.isAppUpdate();
    if (isAppUpdate) {
        [self p_setupdateCurrentDB];
    }
}

-(void)p_setupdateCurrentDB
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *storePath = appInfoServerUtil.getDBFilePath();
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:kDatabaseDBName
                                                           ofType:kDBFileSuffix];
    NSError *error = nil;
    //如果bundle存在才会进行替换
    if(bundlePath)
    {
        [fileManager removeItemAtPath:storePath error:&error];
        [fileManager copyItemAtPath:bundlePath toPath:storePath error:&error];
       
    }
    //更新数据库版本字段
    if(!error)
    {
        id<FMDBAppUpgradeDBHelperInterface> verSqliteEngine = [FMDBAppUpgradeFactory getAppUpgradeDBHelper];
        [verSqliteEngine upgradeAppVersion:FMDBReleaseCurrentVersion];
    }
}

@end
