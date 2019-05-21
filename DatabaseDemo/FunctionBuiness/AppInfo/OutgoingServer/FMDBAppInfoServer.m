//
//  FMDBAppInfoServer.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMDBAppInfoServer.h"
#import "FMDBFileUtil.h"

NSString *_Nullable const kDatabaseDBName = @"FMDBDatabaseDB";
NSString *_Nullable const kDatabaseDBFullName = @"FMDBDatabaseDB.sqlite";
//数据库后缀名
NSString *_Nullable const kDBFileSuffix = @"sqlite";
//数据库目录
NSString *_Nullable const kDBFileDirectory = @"FMDBDBFileDir";

static inline NSString* getDBFilePath(void)
{
    NSString *fileDir = [FMDBFileUtil fileDocDir:kDBFileDirectory];
    if (![FMDBFileUtil fileExistAtPath:fileDir]) {
        BOOL suc = [FMDBFileUtil fileCreateDir:fileDir];
        if (!suc) {
            NSLog(@"数据库存储目录创建失败:%s",__FUNCTION__);
        }
    }
    NSString *filePath = [fileDir stringByAppendingPathComponent:kDatabaseDBFullName];
    return filePath;
}

const struct FMDBAppInfoServerUtil appInfoServerUtil = {
    .getDBFilePath = getDBFilePath,
};
