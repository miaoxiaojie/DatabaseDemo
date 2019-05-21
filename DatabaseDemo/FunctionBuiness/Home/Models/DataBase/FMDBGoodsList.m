//
//  FMDBGoodsList.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMDBGoodsList.h"

@implementation FMDBGoodsList

+(NSArray<NSDictionary *> *)getGoodsList
{
    NSArray *list = [NSArray array];
    NSDictionary *oneDict = @{@"id":@"1",
                              @"name":@"电饭煲",
                              @"picture":@"RiceCooker",
                              @"price":@"99元",
                              @"collection":@"1",
                              @"goodsdescribe":@"做的饭好吃又香"
                              };
    NSDictionary *twoDict = @{@"id":@"2",
                              @"name":@"高压锅",
                              @"picture":@"ThePressureCooker",
                              @"price":@"399元",
                              @"collection":@"0",
                              @"goodsdescribe":@"做的饭好吃又香"
                              };
    
    list = @[oneDict,twoDict];
    return list;
}

+(NSDictionary *)getInsertDict
{
    NSDictionary *oneDict = @{@"id":@"1",
                              @"name":@"奶锅",
                              @"picture":@"MilkPan",
                              @"price":@"69元",
                              @"collection":@"1",
                              @"goodsdescribe":@"奶锅宝宝婴儿辅食不粘锅家用热牛奶煮泡面"
                              };
    return oneDict;
}

@end
