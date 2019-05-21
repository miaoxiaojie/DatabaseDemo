//
//  FMDBStartBaseModule.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/14.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMDBStartBaseModule.h"
#import "FMDBStartApplicationCenter.h"

@implementation FMDBStartBaseModule


#pragma mark - CMBCBLLaunchModuleInterface

- (void)finished
{
    FMDBStartApplicationCenter *eventCenter = [FMDBStartApplicationCenter sharedAppEventCenter];
    [eventCenter removeFinishedModule:[self businessID]];
}

- (NSString *)businessID
{
    return NSStringFromClass([self class]);
}

@end
