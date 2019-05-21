//
//  FMDBAppInfoServer.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

//数据库名称
extern NSString * _Nullable const kDatabaseDBName;
extern NSString * _Nullable const kDatabaseDBFullName;
//数据库后缀名
extern NSString * _Nullable const kDBFileSuffix;


extern const struct FMDBAppInfoServerUtil{
    
    NSString *(*getDBFilePath)(void);
    
}appInfoServerUtil;
