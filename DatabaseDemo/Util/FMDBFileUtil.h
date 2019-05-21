//
//  FMDBFileUtil.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMDBFileUtil : NSObject
/*
 *获取沙盒目录
 */
+ (NSString *)fileHomeDir;
/*
 *获取Documents目录并附加path路径
 *path 文件名或相对路径
 */
+ (NSString *)fileDocDir:(NSString *)path;
/**
 目录或文件是否存在

 @param path 路径/目录
 @return YES/NO
 */
+ (BOOL)fileExistAtPath:(NSString *)path;
/**
 创建目录/文件

 @param path 目录/文件路径
 @return YES/NO
 */
+ (BOOL)fileCreateDir:(NSString *)path;

/**
 将fromPath源文件拷贝到toPath路径下

 @param fromPath 源文件路径
 @param toPath 目标文件路径
 @return 文件是否拷贝成功
 */
+ (BOOL)fileCopy:(NSString *)fromPath toPath:(NSString *)toPath;

@end

NS_ASSUME_NONNULL_END
