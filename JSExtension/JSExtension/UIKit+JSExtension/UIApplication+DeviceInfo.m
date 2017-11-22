//
//  UIApplication+DeviceInfo.m
//
//  Created by ShenYj on 2017/11/22.
//  Copyright © 2017年 ShenYj. All rights reserved.
//

/*** IP ***/
#import <ifaddrs.h>
#import <arpa/inet.h>
/*** 设备模型型号 ***/
#import <sys/utsname.h>
#import "UIApplication+DeviceInfo.h"
/*** 获取运营商的信息 ***/
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
/*** 播放系统声音、提醒声音和振动设备 ***/
#import <AudioToolbox/AudioToolbox.h>

@implementation UIApplication (DeviceInfo)

- (NSString *)js_deviceModelName
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    // 模拟器
    if ([deviceModel isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceModel isEqualToString:@"x86_64"])       return @"Simulator";
    
    //iPhone 系列
    if ([deviceModel isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([deviceModel isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([deviceModel isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([deviceModel isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone3,2"])    return @"Verizon iPhone 4";
    if ([deviceModel isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceModel isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceModel isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([deviceModel isEqualToString:@"iPhone5,3"])    return @"iPhone 5C";
    if ([deviceModel isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
    if ([deviceModel isEqualToString:@"iPhone6,1"])    return @"iPhone 5S";
    if ([deviceModel isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
    if ([deviceModel isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceModel isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceModel isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceModel isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([deviceModel isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceModel isEqualToString:@"iPhone9,1"])    return @"iPhone 7 (CDMA)";
    if ([deviceModel isEqualToString:@"iPhone9,3"])    return @"iPhone 7 (GSM)";
    if ([deviceModel isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus (CDMA)";
    if ([deviceModel isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus (GSM)";
    if ([deviceModel isEqualToString:@"iPhone10,1"])   return @"iPhone 8 (CDMA)";
    if ([deviceModel isEqualToString:@"iPhone10,4"])   return @"iPhone 8 (GSM)";
    if ([deviceModel isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus (CDMA)";
    if ([deviceModel isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus (GSM)";
    if ([deviceModel isEqualToString:@"iPhone10,3"])   return @"iPhone X (CDMA)";
    if ([deviceModel isEqualToString:@"iPhone10,6"])   return @"iPhone X (GSM)";
    
    //iPod 系列
    if ([deviceModel isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceModel isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceModel isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceModel isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceModel isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([deviceModel isEqualToString:@"iPod7,1"])      return @"iPod Touch 6G";
    
    //iPad 系列
    if ([deviceModel isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceModel isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    
    if ([deviceModel isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceModel isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceModel isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
    if ([deviceModel isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([deviceModel isEqualToString:@"iPad2,6"])      return @"iPad Mini (GSM)";
    if ([deviceModel isEqualToString:@"iPad2,7"])      return @"iPad Mini (CDMA)";
    
    if ([deviceModel isEqualToString:@"iPad3,1"])      return @"iPad 3(WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,2"])      return @"iPad 3(CDMA)";
    if ([deviceModel isEqualToString:@"iPad3,3"])      return @"iPad 3(4G)";
    if ([deviceModel isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceModel isEqualToString:@"iPad3,5"])      return @"iPad 4 (4G)";
    if ([deviceModel isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    
    if ([deviceModel isEqualToString:@"iPad4,1"])      return @"iPad Air";
    if ([deviceModel isEqualToString:@"iPad4,2"])      return @"iPad Air";
    if ([deviceModel isEqualToString:@"iPad4,3"])      return @"iPad Air";
    if ([deviceModel isEqualToString:@"iPad4,4"])      return @"iPad Mini 2";
    if ([deviceModel isEqualToString:@"iPad4,5"])      return @"iPad Mini 2";
    if ([deviceModel isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    if ([deviceModel isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([deviceModel isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([deviceModel isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    
    if ([deviceModel isEqualToString:@"iPad5,1"])      return @"iPad Mini 4";
    if ([deviceModel isEqualToString:@"iPad5,2"])      return @"iPad Mini 4";
    if ([deviceModel isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceModel isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    
    if ([deviceModel isEqualToString:@"iPad6,3"])      return @"iPad PRO (12.9)";
    if ([deviceModel isEqualToString:@"iPad6,4"])      return @"iPad PRO (12.9)";
    if ([deviceModel isEqualToString:@"iPad6,7"])      return @"iPad PRO (9.7)";
    if ([deviceModel isEqualToString:@"iPad6,8"])      return @"iPad PRO (9.7)";
    if ([deviceModel isEqualToString:@"iPad6,11"])     return @"iPad 5";
    if ([deviceModel isEqualToString:@"iPad6,12"])     return @"iPad 5";
    
    if ([deviceModel isEqualToString:@"iPad7,1"])      return @"iPad PRO 2 (12.9)";
    if ([deviceModel isEqualToString:@"iPad7,2"])      return @"iPad PRO 2 (12.9)";
    if ([deviceModel isEqualToString:@"iPad7,3"])      return @"iPad PRO (10.5)";
    if ([deviceModel isEqualToString:@"iPad7,4"])      return @"iPad PRO (10.5)";
    
    return deviceModel;
}

- (NSString *)js_UUIDString
{
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

- (NSString *)js_systemVerion
{
    return [UIDevice currentDevice].systemVersion;
}
- (NSString *)js_ScreenResolution
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width * [UIScreen mainScreen].scale;
    CGFloat height = [UIScreen mainScreen].bounds.size.height * [UIScreen mainScreen].scale;
    return [NSString stringWithFormat:@"%.0f*%.0f",width,height];
}

- (NSString *)js_getAppVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}
- (NSString *)js_getAppBuildVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}
- (NSString *)js_getAppName
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

- (NSString *)js_getIPAddress
{
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
}

- (NSString *)js_subscriberCellularProvider
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    return [NSString stringWithFormat:@"%@",[carrier carrierName]];
}

- (NSString *)js_RadioAccessTechnologyConnectType
{
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    NSString *mConnectType = [[NSString alloc] initWithFormat:@"%@",info.currentRadioAccessTechnology];
    /***
     
     CTRadioAccessTechnologyGPRS             // 介于2G和3G之间，也叫2.5G ,过度技术
     CTRadioAccessTechnologyEdge             // EDGE为GPRS到第三代移动通信的过渡，EDGE俗称2.75G
     CTRadioAccessTechnologyWCDMA
     CTRadioAccessTechnologyHSDPA            // 亦称为3.5G(3?G)
     CTRadioAccessTechnologyHSUPA            // 3G到4G的过度技术
     CTRadioAccessTechnologyCDMA1x           // 3G
     CTRadioAccessTechnologyCDMAEVDORev0     // 3G标准
     CTRadioAccessTechnologyCDMAEVDORevA
     CTRadioAccessTechnologyCDMAEVDORevB
     CTRadioAccessTechnologyeHRPD            // 电信使用的一种3G到4G的演进技术， 3.75G
     CTRadioAccessTechnologyLTE              // 接近4G
     
     ***/
    return mConnectType;
}

- (void)js_notice_playSystemSound
{
    // 播放系统声音
    AudioServicesPlaySystemSound(1005);
}

- (void)js_notice_playAlertSound
{
    // 播放提醒声音
    AudioServicesPlayAlertSound(1006);
}

- (void)js_notice_vibrate
{
    // 执行震动
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (NSString *)js_getBatteryState
{
    UIDevice *device = [UIDevice currentDevice];
    if (device.batteryState == UIDeviceBatteryStateUnknown) {
        return @"UnKnow";
    } else if (device.batteryState == UIDeviceBatteryStateUnplugged) {
        return @"Unplugged";
    } else if (device.batteryState == UIDeviceBatteryStateCharging) {
        return @"Charging";
    } else if (device.batteryState == UIDeviceBatteryStateFull) {
        return @"Full";
    }
    return nil;
}

// 获取电量的等级，0.00 ~ 1.00
- (float)js_getBatteryLevel
{
    return [UIDevice currentDevice].batteryLevel;
}

- (void)js_getBatteryInfoBlack:(BatteryInfoBlack)batteryInfo
{
    NSString *state = [self js_getBatteryState];
    float level = [self js_getBatteryLevel] * 100.0;
    batteryInfo(state,level);
    //yourControlFunc(state, level);  //写自己要实现的获取电量信息后怎么处理
}

//// 打开对电量和电池状态的监控，类似定时器的功能
//- (void)didLoad
//{
//    [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
//    [[NSNotificationCenter defaultCenter] addObserver: self
//                                             selector: @selector(getBatteryInfo:)
//                                                 name: UIDeviceBatteryStateDidChangeNotification
//                                               object: nil];
//    [[NSNotificationCenter defaultCenter] addObserver: self
//                                             selector: @selector(getBatteryInfo:)
//                                                 name: UIDeviceBatteryLevelDidChangeNotification
//                                               object: nil];
//    [NSTimer scheduledTimerWithTimeInterval: 0.5f
//                                     target: self
//                                   selector: @selector(getBatteryInfo:)
//                                   userInfo: nil
//                                    repeats: YES];
//}


@end
