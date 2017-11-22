//
//  UIApplication+DeviceInfo.h
//
//  Created by ShenYj on 2017/11/22.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^BatteryInfoBlack)(NSString *state, float level);
@interface UIApplication (DeviceInfo)

/*** 获取设备信息 ***/
- (NSString *)js_deviceModelName;
- (NSString *)js_UUIDString;
- (NSString *)js_ScreenResolution;
- (NSString *)js_getIPAddress;
- (NSString *)js_systemVerion;

/*** 获取App相关信息 ***/
- (NSString *)js_getAppName;
- (NSString *)js_getAppVersion;
- (NSString *)js_getAppBuildVersion;

/*** 播放系统声音、提醒声音和振动设备 ***/
- (void)js_notice_vibrate;
- (void)js_notice_playSystemSound;
- (void)js_notice_playAlertSound;

/*** 获取电池的相关信息 ***/
- (float)js_getBatteryLevel;
- (NSString *)js_getBatteryState;
- (void)js_getBatteryInfoBlack:(BatteryInfoBlack)batteryInfo;

/*** 获取网络运营商 ***/
- (NSString *)js_subscriberCellularProvider;
/*** 获取当前网络类型 ***/
- (NSString *)js_RadioAccessTechnologyConnectType;

@end
