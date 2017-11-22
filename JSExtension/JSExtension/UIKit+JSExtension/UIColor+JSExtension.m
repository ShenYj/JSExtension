//
//  UIColor+JSExtension.m
//
//  Created by ShenYj on 16/8/18.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "UIColor+JSExtension.h"

@implementation UIColor (JSExtension)

+ (UIColor *)js_RGBColorWithRed:(CGFloat)red withGreen:(CGFloat)green withBlue:(CGFloat)blue
{
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}

+ (UIColor *)js_GrayColor:(CGFloat)number
{
    return [self js_RGBColorWithRed:number withGreen:number withBlue:number];
}

+ (UIColor *)js_randomColor
{
    CGFloat red = random() % 256;
    CGFloat green = random() % 256;
    CGFloat blue = random() % 256;
    return [UIColor js_RGBColorWithRed:red withGreen:green withBlue:blue];
}

+ (UIColor *)js_colorWithHex:(u_int32_t)hex
{
    int red = (hex & 0xFF0000) >> 16;
    int green = (hex & 0x00FF00) >> 8;
    int blue = hex & 0x0000FF;
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}

+ (instancetype)r:(uint8_t)r g:(uint8_t)g b:(uint8_t)b alphaComponent:(CGFloat)alpha
{
    return [[self r:r g:g b:b] colorWithAlphaComponent:alpha];
}

+ (instancetype)r:(uint8_t)r g:(uint8_t)g b:(uint8_t)b
{
    return [self r:r g:g b:b a:0xff];
}

+ (instancetype)r:(uint8_t)r g:(uint8_t)g b:(uint8_t)b a:(uint8_t)a
{
    return [self colorWithRed:r / 255. green:g / 255. blue:b / 255. alpha:a / 255.];
}

+ (instancetype)rgba:(NSUInteger)rgba
{
    return [self r:(rgba >> 24)&0xFF g:(rgba >> 16)&0xFF b:(rgba >> 8)&0xFF a:rgba&0xFF];
}

+ (instancetype)colorWithHexString:(NSString *)hexString
{
    if (!hexString)
        return nil;
    
    NSString* hex = [NSString stringWithString:hexString];
    if ([hex hasPrefix:@"#"])
        hex = [hex substringFromIndex:1];
    
    if (hex.length == 6)
        hex = [hex stringByAppendingString:@"FF"];
    else if (hex.length != 8)
        return nil;
    
    uint32_t rgba;
    NSScanner* scanner = [NSScanner scannerWithString:hex];
    [scanner scanHexInt:&rgba];
    return [UIColor rgba:rgba];
}

- (NSUInteger)rgbaValue
{
    CGFloat r, g, b, a;
    if ([self getRed:&r green:&g blue:&b alpha:&a]) {
        NSUInteger rr = (NSUInteger)(r * 255 + 0.5);
        NSUInteger gg = (NSUInteger)(g * 255 + 0.5);
        NSUInteger bb = (NSUInteger)(b * 255 + 0.5);
        NSUInteger aa = (NSUInteger)(a * 255 + 0.5);
        
        return (rr << 24) | (gg << 16) | (bb << 8) | aa;
    } else {
        return 0;
    }
}

@end
