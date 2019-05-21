//
//  FMDBAppUpgradeOutgoingFactory.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/15.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMDBAppUpgradeOutgoingFactory.h"
#import "FMDBAppUpgradeManager.h"

@implementation FMDBAppUpgradeOutgoingFactory

+ (id<FMDBAppUpgradeManagerInterface>)getAppUpgradeManager{
    id<FMDBAppUpgradeManagerInterface> upgradeManager = [[FMDBAppUpgradeManager alloc]init];
    return upgradeManager;
}

@end
