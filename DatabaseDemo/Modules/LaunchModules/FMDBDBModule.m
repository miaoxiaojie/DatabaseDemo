//
//  FMDBDBModule.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/14.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMDBDBModule.h"
#import "AppDelegate.h"
#import "FMDBAppInfoServer.h"
#import "FMDBFileUtil.h"
#import "FMDBAppUpgradeManagerInterface.h"
#import "FMDBAppUpgradeOutgoingFactory.h"

@implementation FMDBDBModule

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self p_copyFMDBAppDB];
    [self p_resUpgrade];
    [self finished];
    return YES;
}

/**
 *  拷贝应用数据库文件
 */
- (void)p_copyFMDBAppDB
{
    NSString *filePath =  appInfoServerUtil.getDBFilePath();
    if (![FMDBFileUtil fileExistAtPath:filePath]) {
        NSString *fromPath = [[NSBundle mainBundle] pathForResource:kDatabaseDBName ofType:kDBFileSuffix];
        [FMDBFileUtil fileCopy:fromPath toPath:filePath];
    }
}
/**
 *  数据库升级
 */
-(void)p_resUpgrade
{
    id<FMDBAppUpgradeManagerInterface> appUpgradeManager = [FMDBAppUpgradeOutgoingFactory getAppUpgradeManager];
    [appUpgradeManager updateRescourceWhenUpgradeApp];
}

@end
