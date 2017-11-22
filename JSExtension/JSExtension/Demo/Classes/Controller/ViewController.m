//
//  ViewController.m
//  JSExtension
//
//  Created by ShenYj on 2016/12/14.
//  Copyright © 2016年 ShenYj. All rights reserved.
//

#import "ViewController.h"
#import "JSUIkitExtension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *deviceModelName = [[UIApplication sharedApplication] js_deviceModelName];
    NSString *UUIDString = [[UIApplication sharedApplication] js_UUIDString];
    NSString *systemVersion = [[UIApplication sharedApplication] js_systemVerion];
    NSString *screenResolution = [[UIApplication sharedApplication] js_ScreenResolution];
    NSString *subscriberCellularProvider = [[UIApplication sharedApplication] js_subscriberCellularProvider];
    NSString *radioAccessTechnologyConnectType = [[UIApplication sharedApplication] js_RadioAccessTechnologyConnectType];
    
    
    NSString *AppName = [[UIApplication sharedApplication] js_getAppName];
    NSString *appAppVersion = [[UIApplication sharedApplication] js_getAppVersion];
    NSString *appBuildVersion = [[UIApplication sharedApplication] js_getAppBuildVersion];
    
    float batteryLevel = [[UIApplication sharedApplication] js_getBatteryLevel];
    NSString *batteryState = [[UIApplication sharedApplication] js_getBatteryState];
    [[UIApplication sharedApplication] js_getBatteryInfoBlack:^(NSString *state, float level) {
        NSLog(@"state: %@, level: %f",state,level);
    }];
    
    NSLog(@"deviceModelName: %@\n",deviceModelName);
    NSLog(@"systemVersion: %@\n",systemVersion);
    NSLog(@"UUIDString: %@\n",UUIDString);
    NSLog(@"screenResolution: %@\n",screenResolution);
    NSLog(@"subscriberCellularProvider: %@\n",subscriberCellularProvider);
    NSLog(@"radioAccessTechnologyConnectType: %@\n",radioAccessTechnologyConnectType);
    
    NSLog(@"AppName: %@\n",AppName);
    NSLog(@"appAppVersion: %@\n",appAppVersion);
    NSLog(@"appBuildVersion: %@\n",appBuildVersion);
    NSLog(@"batteryLevel: %f\n",batteryLevel);
    NSLog(@"batteryState: %@\n",batteryState);
}


@end
