//
//  UIView+JSFrame.m
//  彩票
//
//  Created by ShenYj on 16/5/13.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import "UIView+JSFrame.h"

@implementation UIView (JSFrame)


- (void)setX:(CGFloat)x{
    
    
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
    
}

- (CGFloat)x{
    
    return self.frame.origin.x;
}


- (void)setY:(CGFloat)y{
    
    
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
    
}
- (CGFloat)y{
    
    return self.frame.origin.y;
}

- (void)setW:(CGFloat)w{
    
    CGRect frame = self.frame;
    frame.size.width = w;
    self.frame = frame;
    
}
- (CGFloat)w{
    
    return self.frame.size.width;
}

- (void)setH:(CGFloat)h{
    
    CGRect frame = self.frame;
    frame.size.height = h;
    self.frame = frame;
    
}

- (CGFloat)h{
    
    return self.frame.size.height;
}

@end
