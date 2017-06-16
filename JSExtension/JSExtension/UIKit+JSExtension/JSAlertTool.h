//
//  JSAlertTool.h
//  Ecg2G
//
//  Created by ecg on 2017/6/8.
//  Copyright © 2017年 com.aukoecg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface JSAlertTool : NSObject

/*!
 *  @metohd showAlertWithTitle: message:
 *
 *  @param title        标题
 *  @param message      内容
 *
 *  @discussion         不带按钮的alert展示
 */
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message delayTime:(CGFloat)time;

/*!
 *  @metohd getCurrentVC
 *
 *  @discussion         获取当前屏幕显示的ViewController
 */
+ (UIViewController *)getCurrentVC;

/*!
 *  @metohd js_logState
 *
 *  @discussion         输出相关状态
 */
+ (void)js_logState;

@end
