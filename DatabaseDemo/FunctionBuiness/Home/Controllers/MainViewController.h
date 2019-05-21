//
//  MainViewController.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMViewController.h"
#import "DBQViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UITabBarController

@property (nonatomic , assign) NSInteger currentTabIndex;
@property (nonatomic, strong) FMViewController *firstVC;
@property (nonatomic, strong) DBQViewController *secondVC;

@end

NS_ASSUME_NONNULL_END
