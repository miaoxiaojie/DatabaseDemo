//
//  FMDBFileUtil.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMDBFileUtil.h"

@implementation FMDBFileUtil

+ (NSString *)fileHomeDir{
    NSString *path = NSHomeDirectory();
    return path;
}

+ (NSString *)fileDocDir:(NSString *)path {
    NSString *docDir = [FMDBFileUtil fileDocDir];
    NSString *filePath = [docDir stringByAppendingPathComponent:path];
    return filePath;
}

+ (NSString *)fileDocDir {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return docDir;
}

+ (BOOL)fileExistAtPath:(NSString *)path {
    NSFileManager *filemanager = [NSFileManager defaultManager];
    return [filemanager fileExistsAtPath:path];
}

+ (BOOL)fileCreateDir:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    BOOL success = [fileManager createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:&error];
    if (!success)
    {
        NSLog(@"fileCreateDir Error : %@",[error localizedDescription]);
    }
    return success;
}

+ (BOOL)fileCopy:(NSString *)fromPath toPath:(NSString *)toPath
{
    BOOL success = NO;
    if (![FMDBFileUtil fileExistAtPath:fromPath]) {
        NSLog(@"fileCopy Error : from file is error");
        success = NO;
    }
    else {
        NSFileManager *filemanager = [NSFileManager defaultManager];
        NSError *error;
        success = [filemanager copyItemAtPath:fromPath toPath:toPath error:&error];
        if (!success)
        {
            NSLog(@"fileCopy Error : %@",[error localizedDescription]);
        }
    }
    return success;
}


@end
