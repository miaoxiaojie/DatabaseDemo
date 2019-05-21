//
//  FMDBStartModuleConfig.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/14.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMDBStartModuleConfig.h"
#import "FMDBDBModule.h"
#import "FMDBBackgroundRunModule.h"

NSString *const kLaunchModuleClassNameKey = @"className";
NSString *const kLaunchModuleJsonKey = @"configItems";

@implementation FMDBStartModuleConfig

+ (NSArray *)getConfigInfo
{
    return @[@{kLaunchModuleClassNameKey:NSStringFromClass([FMDBDBModule class])},//DB文件操作
             @{kLaunchModuleClassNameKey:NSStringFromClass([FMDBBackgroundRunModule class])}//iOS向后台申请一段时间
             ];

}



@end
