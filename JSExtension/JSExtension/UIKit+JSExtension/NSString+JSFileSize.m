//
//  NSString+JSFileSize.m
//  Bewilder
//
//  Created by ShenYj on 2017/3/13.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import "NSString+JSFileSize.h"

@implementation NSString (JSFileSize)

- (unsigned long long)fileSize {
    
    unsigned long long fileSize = 0;
    // 文件管理者
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 通过当前路径获取文件或文件夹
    NSError *error = nil;
    NSDictionary *attributes = [fileManager attributesOfItemAtPath:self error:&error];
    if (error || !attributes) {
        NSLog(@"%@",error);
        return 0.0;
    }
    // 判断类型 文件 或 文件夹 或者 其他
    NSString *fileType = attributes.fileType;
    
    if ([fileType isEqualToString:NSFileTypeDirectory]) {
        // 文件夹
        NSArray <NSString *>*subPaths = [fileManager subpathsAtPath:self];
        // 遍历子路径,累加文件大小
        for (NSString *subPath in subPaths) {
            // 拼接全路径
            NSString *fullPath = [self stringByAppendingPathComponent:subPath];
            NSError *error = nil;
            NSDictionary *attrs = [fileManager attributesOfItemAtPath:fullPath error:&error];
            if (error) {
                NSLog(@"%@",error);
            }
            fileSize += attrs.fileSize;
            
        }
    } else if ([fileType isEqualToString:NSFileTypeRegular]) {
        // 文件
        fileSize = attributes.fileSize;
    }
    return fileSize;
}

- (void)logFileSize {
    
    unsigned long long fileSize = 0;
    // 文件管理者
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // 是否为文件夹
    BOOL isDirectory = NO;
    //  路径是否仔仔
    BOOL isExist = [fileManager fileExistsAtPath:self isDirectory:&isDirectory];
    
    if (!isExist) {
        return;
    }
    
    if (isDirectory) {
        // 文件夹
        NSArray <NSString *>*subPaths = [fileManager subpathsAtPath:self];
        // 遍历子路径,累加文件大小
        for (NSString *subPath in subPaths) {
            // 拼接全路径
            NSString *fullPath = [self stringByAppendingPathComponent:subPath];
            NSError *error = nil;
            NSDictionary *attrs = [fileManager attributesOfItemAtPath:fullPath error:&error];
            if (error) {
                NSLog(@"%@",error);
            }
            fileSize += attrs.fileSize;
            
        }
    } else {
        // 通过当前路径获取文件或文件夹
        NSError *error = nil;
        NSDictionary *attributes = [fileManager attributesOfItemAtPath:self error:&error];
        if (error || !attributes) {
            NSLog(@"%@",error);
            return ;
        }
        // 文件
        fileSize = attributes.fileSize;
    }
    NSLog(@"文件/文件夹大小:%llu B",fileSize);
}

@end
