//
//  FMDBAppUpgradeFactory.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/15.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMDBAppUpgradeFactory.h"
#import "FMDBAppUpgradeDBHelper.h"

@implementation FMDBAppUpgradeFactory

+ (id<FMDBAppUpgradeDBHelperInterface>)getAppUpgradeDBHelper
{
    id<FMDBAppUpgradeDBHelperInterface> appUpgradeDBHelper = [[FMDBAppUpgradeDBHelper alloc]init];
    return appUpgradeDBHelper;
}

@end
