//
//  FMDBBaseService.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDBBaseServiceInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FMDBBaseService : NSObject<FMDBBaseServiceInterface>

- (instancetype)initWithPath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
