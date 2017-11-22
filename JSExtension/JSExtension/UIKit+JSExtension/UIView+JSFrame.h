//
//  UIView+JSFrame.h
//
//  Created by ShenYj on 16/5/13.
//  Copyright © 2016年 ___ShenYJ___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JSFrame)

@property (nonatomic,assign) CGFloat js_x;
@property (nonatomic,assign) CGFloat js_y;
@property (nonatomic,assign) CGFloat js_w;
@property (nonatomic,assign) CGFloat js_h;
@property (nonatomic,assign) CGFloat js_right;
@property (nonatomic,assign) CGFloat js_bottom;
@property (nonatomic,assign) CGFloat js_centerX;
@property (nonatomic,assign) CGFloat js_centerY;
@property (nonatomic,assign) CGPoint js_origin;
@property (nonatomic,assign) CGSize  js_size;

@end
