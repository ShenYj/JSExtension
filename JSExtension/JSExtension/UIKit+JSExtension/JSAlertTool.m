//
//  JSAlertTool.m
//  Ecg2G
//
//  Created by ecg on 2017/6/8.
//  Copyright © 2017年 com.aukoecg. All rights reserved.
//

#import "JSAlertTool.h"

@implementation JSAlertTool

+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message delayTime:(CGFloat)time
{
    CGFloat delayT = time > 0 ? time : 1;
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [[self getCurrentVC] presentViewController:alertController animated:YES completion:^{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayT * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alertController dismissViewControllerAnimated:YES completion:nil];
        });
    }];
    
}

// 获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    } else {
        result = window.rootViewController;
    }
    return result;
}


+ (void)js_logState
{
    NSString *centralBLEState = @"";
    NSString *centralConnectState = @"";
    NSString *applicationState = @"";
    
    /*  - 蓝牙中央管理者
     CBManagerStateUnknown = 0,
     CBManagerStateResetting,
     CBManagerStateUnsupported,
     CBManagerStateUnauthorized,
     CBManagerStatePoweredOff,
     CBManagerStatePoweredOn,
     */
    switch ([JSBluetoothManager sharedCentralBluetoothManager].centralManager.state) {
        case CBManagerStateUnknown:
            centralBLEState = @"设备蓝牙状态未知";
            break;
        case CBManagerStateResetting:
            centralBLEState = @"设备蓝牙重置中";
            break;
        case CBManagerStateUnsupported:
            centralBLEState = @"设备蓝牙不支持";
            break;
        case CBManagerStateUnauthorized:
            centralBLEState = @"设备蓝牙未授权";
            break;
        case CBManagerStatePoweredOff:
            centralBLEState = @"设备蓝牙关闭";
            break;
        case CBManagerStatePoweredOn:
            centralBLEState = @"设备蓝牙开启";
            break;
        default:
            break;
    }
    /*** -- 蓝牙中央管理者的连接状态  ***/
    switch ([JSBluetoothManager sharedCentralBluetoothManager].deviceIsConnecting) {
        case 0:
            centralConnectState = @"未连接";
            break;
        case 1:
            centralConnectState = @"连接中";
        default:
            break;
    }
    
    /*
     UIApplicationStateActive,
     UIApplicationStateInactive,
     UIApplicationStateBackground
     */
    switch ([UIApplication sharedApplication].applicationState) {
        case UIApplicationStateActive:
            applicationState = @"前台";
            break;
        case UIApplicationStateInactive:
            applicationState = @"待激活";
            break;
        case UIApplicationStateBackground:
            applicationState = @"后台";
            break;
        default:
            break;
    }
    
    NSLog(@" >> 设备蓝牙启用状态:(%@) ,设备连接状态:(%@) ,应用状态:(%@) << ",centralBLEState,centralConnectState,applicationState);
}

@end
