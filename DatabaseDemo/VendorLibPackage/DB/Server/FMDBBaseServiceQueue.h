//
//  FMDBBaseServiceQueue.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDBBaseServiceQueueInterface.h"

NS_ASSUME_NONNULL_BEGIN

@interface FMDBBaseServiceQueue : NSObject<FMDBBaseServiceQueueInterface>

- (instancetype)initWithPath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
