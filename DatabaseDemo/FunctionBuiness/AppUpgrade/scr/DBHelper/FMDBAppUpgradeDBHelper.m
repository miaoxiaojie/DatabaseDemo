//
//  FMDBAppUpgradeDBHelper.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/15.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMDBAppUpgradeDBHelper.h"
#import "FMDBBaseServiceQueueInterface.h"
#import "FMDBUtil.h"
#import "FMDBBaseServiceInterface.h"

static NSString *const kCMBCVerPID = @"1";

static NSString *const kselectSqlFromId = @"select * from APPDBVER where app_id = ?";
static NSString *const kupdateSqlFromId = @"update APPDBVER set app_ver = ? where app_id = ?";

@interface FMDBAppUpgradeDBHelper ()

@property (strong,nonatomic) id<FMDBBaseServiceQueueInterface> dbQueue;

@end

@implementation FMDBAppUpgradeDBHelper

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dbQueue = [FMDBUtil getSqlWrapperQueue];
    }
    return self;
}

#pragma mark - CMBCAppUpdateDBHelperInterface
- (NSString *)getAppVersionInfo
{
    __block NSString *result = @"";
    [self.dbQueue inDatabase:^(id<FMDBBaseServiceInterface> dbServer) {
        
        NSArray *args = @[kCMBCVerPID];
        NSArray *list = [dbServer executeQuery:kselectSqlFromId arguments:args];
        if (list.count > 0) {
            NSDictionary *info = [list objectAtIndex:0];
            result = [info objectForKey:@"app_ver"];
        }
    }];
    return result;
}

- (BOOL)upgradeAppVersion:(NSString *)aVersion
{
    __block BOOL result = NO;
    [self.dbQueue inDatabase:^(id<FMDBBaseServiceInterface> dbServer) {
        
        NSArray *args = @[aVersion,kCMBCVerPID];
        result = [dbServer executeNonQuery:kupdateSqlFromId arguments:args];
        
    }];
    return result;
}

@end
