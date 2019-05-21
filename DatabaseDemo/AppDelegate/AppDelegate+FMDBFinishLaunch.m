//
//  AppDelegate+FMDBFinishLaunch.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/17.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "AppDelegate+FMDBFinishLaunch.h"
#import "RunTimeUtil.h"

@implementation AppDelegate (FMDBFinishLaunch)

+ (void)load
{
    //启动程序时初始化
    runTimeUtil.transforInstanceMethod([self class],
                                            @selector(application:didFinishLaunchingWithOptions:),
                                            @selector(transfor_loadingAdvertisingApplication:didFinishLaunchingWithOptions:));
}

-(BOOL)transfor_loadingAdvertisingApplication:(UIApplication *)application
          didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self transfor_loadingAdvertisingApplication:application didFinishLaunchingWithOptions:launchOptions];
    
   
    
    return YES;
}


@end
