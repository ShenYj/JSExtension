//
//  UIView+JSFrame.m
//
//  Created by ShenYj on 16/5/13.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "UIView+JSFrame.h"

@implementation UIView (JSFrame)

- (void)setJs_x:(CGFloat)js_x
{
    CGRect frame = self.frame;
    frame.origin.x = js_x;
    self.frame = frame;
}
- (CGFloat)js_x
{
    return self.frame.origin.x;
}
- (void)setJs_y:(CGFloat)js_y
{
    CGRect frame = self.frame;
    frame.origin.y = js_y;
    self.frame = frame;
}
- (CGFloat)js_y
{
    return self.frame.origin.y;
}
- (void)setJs_w:(CGFloat)js_w
{
    CGRect frame = self.frame;
    frame.size.width = js_w;
    self.frame = frame;
}
- (CGFloat)js_w
{
    return self.frame.size.width;
}
- (void)setJs_h:(CGFloat)js_h
{
    CGRect frame = self.frame;
    frame.size.height = js_h;
    self.frame = frame;
}
- (CGFloat)js_h
{
    return self.frame.size.height;
}
- (void)setJs_right:(CGFloat)js_right
{
    CGRect frame = self.frame;
    frame.origin.x = js_right - frame.size.width;
    self.frame = frame;
}
- (CGFloat)js_right
{
    return self.frame.origin.x + self.frame.size.width;
}
- (void)setJs_bottom:(CGFloat)js_bottom
{
    CGRect frame = self.frame;
    frame.origin.y = js_bottom - frame.size.height;
    self.frame = frame;
}
- (CGFloat)js_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setJs_centerX:(CGFloat)js_centerX
{
    self.center = CGPointMake(js_centerX, self.center.y);
}
- (CGFloat)js_centerX
{
    return self.center.x;
}
- (void)setJs_centerY:(CGFloat)js_centerY
{
    self.center = CGPointMake(self.center.x, js_centerY);
}
- (CGFloat)js_centerY
{
    return self.center.y;
}
- (void)setJs_origin:(CGPoint)js_origin
{
    CGRect frame = self.frame;
    frame.origin = js_origin;
    self.frame = frame;
}
- (CGPoint)js_origin
{
    return self.frame.origin;
}
- (void)setJs_size:(CGSize)js_size
{
    CGRect frame = self.frame;
    frame.size = js_size;
    self.frame = frame;
}
- (CGSize)js_size
{
    return self.frame.size;
}


@end
