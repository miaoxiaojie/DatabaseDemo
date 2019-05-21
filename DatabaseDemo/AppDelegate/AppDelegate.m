//
//  AppDelegate.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/7.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "FMDBStartApplicationCenter.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (void)load
{
   //注册
    [[FMDBStartApplicationCenter sharedAppEventCenter] registedAllModules];

}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    FMDBStartApplicationCenter *center = [FMDBStartApplicationCenter sharedAppEventCenter];
    [center handleApplicationEvent:@"application:didFinishLaunchingWithOptions:" Complete:^(id  _Nonnull module, SEL  _Nonnull sel) {
        
        IMP imp = [module methodForSelector:sel];
        void (*func)(id, SEL,UIApplication *,NSDictionary *) = (void *)imp;
        func(module,sel,application,launchOptions);
    
    }];
    
    [self p_loadAppRootViewController];
    return YES;
   
}


- (void)applicationWillResignActive:(UIApplication *)application {
 
    FMDBStartApplicationCenter *center = [FMDBStartApplicationCenter sharedAppEventCenter];
    [center handleApplicationEvent:@"applicationDidEnterBackground:" Complete:^(id  _Nonnull module, SEL  _Nonnull sel) {
        
        IMP imp = [module methodForSelector:sel];
        void (*func)(id, SEL,UIApplication *) = (void *)imp;
        func(module,sel,application);
        
    }];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    FMDBStartApplicationCenter *center = [FMDBStartApplicationCenter sharedAppEventCenter];
    [center handleApplicationEvent:@"applicationDidEnterBackground:" Complete:^(id  _Nonnull module, SEL  _Nonnull sel) {
        
        IMP imp = [module methodForSelector:sel];
        void (*func)(id, SEL,UIApplication *) = (void *)imp;
        func(module,sel,application);
        
    }];
   
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    
    FMDBStartApplicationCenter *center = [FMDBStartApplicationCenter sharedAppEventCenter];
    [center handleApplicationEvent:@"applicationWillEnterForeground:" Complete:^(id  _Nonnull module, SEL  _Nonnull sel) {
        
        IMP imp = [module methodForSelector:sel];
        void (*func)(id, SEL,UIApplication *) = (void *)imp;
        func(module,sel,application);
        
    }];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
    FMDBStartApplicationCenter *center = [FMDBStartApplicationCenter sharedAppEventCenter];
    [center handleApplicationEvent:@"applicationDidEnterBackground:" Complete:^(id  _Nonnull module, SEL  _Nonnull sel) {
        
        IMP imp = [module methodForSelector:sel];
        void (*func)(id, SEL,UIApplication *) = (void *)imp;
        func(module,sel,application);
        
    }];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    FMDBStartApplicationCenter *center = [FMDBStartApplicationCenter sharedAppEventCenter];
    [center handleApplicationEvent:@"applicationDidEnterBackground:" Complete:^(id  _Nonnull module, SEL  _Nonnull sel) {
        
        IMP imp = [module methodForSelector:sel];
        void (*func)(id, SEL,UIApplication *) = (void *)imp;
        func(module,sel,application);
        
    }];
}

-(void)p_loadAppRootViewController
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    MainViewController *mainVC = [[MainViewController alloc] init];
    self.window.rootViewController = mainVC;
}
@end
