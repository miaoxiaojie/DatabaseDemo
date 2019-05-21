//
//  FMDBBackgroundRunModule.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/21.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMDBBackgroundRunModule.h"
#import "AppDelegate.h"

#define backGroundRunTime       180   //180s
static NSInteger  backGroundCount = 0;

@interface FMDBBackgroundRunModule()
@property (assign, nonatomic) UIBackgroundTaskIdentifier backgroundIdentifier;
@property (strong, nonatomic) NSTimer *countTimer;

@end

@implementation FMDBBackgroundRunModule

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self p_startTimerCount];
    
    __weak __typeof(&*self)weakSelf = self;
    self.backgroundIdentifier = [application beginBackgroundTaskWithExpirationHandler:^(void) {
        [weakSelf p_entryBackGroundCountTask];
    }];
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    backGroundCount = 0;
    [self p_stopTimerCount];
}

#pragma mark - Private Mothed
-(void)p_entryBackGroundCountTask
{
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    __block typeof(self)bself = self;
    dispatch_async(mainQueue, ^(void) {
        if (bself != nil){
            [self p_stopTimerCount];
            [[UIApplication sharedApplication] endBackgroundTask:bself.backgroundIdentifier];
            bself.backgroundIdentifier = UIBackgroundTaskInvalid;
        }
    });
}


-(void)p_startTimerCount
{
    if(_countTimer)
    {
        [self p_stopTimerCount];
    }
    backGroundCount = 0;
    self.countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(p_startCountBacnkGround) userInfo:nil repeats:YES];
    
}

- (void)p_stopTimerCount
{
    if([_countTimer isValid])
    {
        [_countTimer invalidate];
    }
    
    
}

-(void)p_startCountBacnkGround
{
    ++backGroundCount;
    if(backGroundCount >= backGroundRunTime)
    {
        exit(0);
    }
    
}

@end
