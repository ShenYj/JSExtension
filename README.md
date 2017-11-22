# JSExtension

- 项目开发中的工具[ShenYj](https://github.com/ShenYj)

## iOS 8.0 + <br>

## 支持pod<br>

#### Podfile

To integrate JSExtension into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'

target 'TargetName' do
pod 'JSExtension'
end
```
Then, run the following command:

```bash
$ pod install
```

And then import the header file in your target:

```bash
#import <JSUIkitExtension.h>
```



## 包含内容<br>

- __NSObject+JSObjc.h__  --> 运行时取得类的属性列表 <br>
- __NSArray+JSLog.h__ --> 控制台打印中文 <br>
- __NSString+Hash.h__ --> MD5相关 <br>
- __NSString+JSExtension.h__ --> 汉字转印标相关 <br>
- __UIImage+JSExtension.h__ --> 图片处理相关 <br>
- __UINavigationController+JSFullScreenPopGesture.h__ --> 运行时全屏返回手势<br>
- __UIView+JSFrame.h__ -->  添加Frame的:x,y,width,height属性 <br>
- __UIColor+JSExtension.h__ --> RGB颜色、随机色以及十六进制设置颜色 <br>
- __NSString+JSFileSize.h__-->获取文件或文件夹总大小(新增)<br>

## 默认未导入的类:

- __JSTextLabel.h__ --> 超链接处理<br>
- __JSDateFormatter.h__ --> 单例类 <br>
- __NSString+Emoji.h__ --> Emoji相关 <br>
- __NSDate+JSIsThisYear.h__ --> NSDate扩展:将NSDate类型对象转换为特定格式的字符串、判断date是否是今年 <br>
