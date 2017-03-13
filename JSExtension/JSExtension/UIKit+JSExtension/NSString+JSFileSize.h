//
//  NSString+JSFileSize.h
//  Bewilder
//
//  Created by ShenYj on 2017/3/13.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSFileSize)

/** 返回文件或文件夹的大小,单位B */
- (unsigned long long)fileSize;

/** 控制台打印文件或文件夹大小 */
- (void)logFileSize;

@end
