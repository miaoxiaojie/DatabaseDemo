//
//  FMDBHomeFactory.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMDBHomeFactory.h"
#import "FMDBGoodsDBHelper.h"
#import "FMDBCityDBHelper.h"

@implementation FMDBHomeFactory

+ (id<FMDBGoodsDBHelperInterface>)getGoodsListDBHelper
{
    FMDBGoodsDBHelper *dbHelper = [[FMDBGoodsDBHelper alloc] init];
    return dbHelper;
}

+(id<FMDBGoodsDBHelperInterface>)getCityDBHelper
{
    FMDBCityDBHelper *dbHelper = [[FMDBCityDBHelper alloc]init];
    return dbHelper;
}

@end
