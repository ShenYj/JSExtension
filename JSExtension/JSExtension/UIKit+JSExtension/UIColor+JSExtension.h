//
//  UIColor+JSExtension.h
//
//  Created by ShenYj on 16/8/18.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JSExtension)

/**
 *  设置RGB颜色
 *
 *  @param red   red: 0 ~ 255
 *  @param green green: 0 ~ 255
 *  @param blue  blue: 0 ~ 255
 *
 *  @return RGB颜色
 */
+ (UIColor *)js_RGBColorWithRed:(CGFloat)red withGreen:(CGFloat)green withBlue:(CGFloat)blue;

/*!
 *  @metohd grayColor:
 *
 *  @param number      0~255的数值,设置需要的灰度值
 *
 *  @discussion        设置指定灰度颜色
 */
+ (UIColor *)js_GrayColor:(CGFloat)number;

/**
 *  生成随机色
 *
 *  @return 返回随机色
 */
+ (UIColor *)js_randomColor;

/**
 *  根据无符号的 32 位整数转换成对应的 RGB 颜色
 *
 *  @param hex hex
 *
 *  @return UIColor
 */
+ (UIColor *)js_colorWithHex:(u_int32_t)hex;

#pragma mark - extend

+ (UIColor *)r:(uint8_t)r g:(uint8_t)g b:(uint8_t)b alphaComponent:(CGFloat)alpha;
+ (UIColor *)r:(uint8_t)r g:(uint8_t)g b:(uint8_t)b;
+ (UIColor *)r:(uint8_t)r g:(uint8_t)g b:(uint8_t)b a:(uint8_t)a;
+ (UIColor *)rgba:(NSUInteger)rgba;
+ (UIColor *)colorWithHexString:(NSString*)hexString;

- (NSUInteger)rgbaValue;


@end
