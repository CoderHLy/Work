//
//  HLCommonDefine.h
//  HLSkate
//
//  Created by 何龙 on 2019/1/30.
//  Copyright © 2019 何龙. All rights reserved.
//

#ifndef HLCommonDefine_h
#define HLCommonDefine_h


//1.获取屏幕宽度与高度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#define SCREEN_STATUS [[UIApplication sharedApplication] statusBarFrame].size.height
#define NativeScale [UIScreen mainScreen].nativeScale
#define NativeBounds [UIScreen mainScreen].nativeBounds

#define SCREEN_SCALE NativeBounds.size.width / 750.0

#define HLGetRealFromPt(x) (x / NativeScale) * SCREEN_SCALE

#define HLGetPxFromPt(x) (x / NativeScale)

//2.获取通知中心
#define HLNotificationCenter [NSNotificationCenter defaultCenter]

//3.设置随机颜色
#define HLRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

//4.设置RGB颜色/设置RGBA颜色
#define HLRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define HLRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
// clear背景颜色
#define HLClearColor [UIColor clearColor]


//7.设置 view 圆角和边框
#define HLViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

//获取图片资源
#define kGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

//14.判断当前的iPhone设备/系统版本
//判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

// 判断是否为 iPhone 4/4s
#define iPhone4_4s NativeBounds.size.width == 640.0f && NativeBounds.size.height == 960.0f

// 判断是否为 iPhone 5/5s/5c/5SE
#define iPhone5_5s_5c_5SE NativeBounds.size.width == 640.0f && NativeBounds.size.height == 1136.0f

// 判断是否为iPhone 6/6s/7
#define iPhone6_6s_7 NativeBounds.size.width == 750.0f && NativeBounds.size.height == 1334.0f

// 判断是否为iPhone 6Plus/6sPlus/7Plus
#define iPhone6Plus_6sPlus_7Plus NativeBounds.size.width == 1242.0f && NativeBounds.size.height == 2208.0f

#define MinSize (iPhone4_4s || iPhone5_5s_5c_5SE || iPhone6_6s_7)
#define MaxSize iPhone6Plus_6sPlus_7Plus

#define FontSize_20 MinSize?10:12
#define FontSize_24 MinSize?12:13
#define FontSize_26 MinSize?13:14
#define FontSize_28 MinSize?14:15
#define FontSize_30 MinSize?15:16
#define FontSize_32 MinSize?16:17
#define FontSize_34 MinSize?17:18
#define FontSize_36 MinSize?18:19
#define FontSize_40 MinSize?20:21
#define FontSize_42 MinSize?21:23
#define FontSize_72 MinSize?36:40

#define kScreen_Max_Length        (MAX(SCREEN_WIDTH, SCREENH_HEIGHT))
#define kScreen_Min_Length        (MIN(SCREEN_WIDTH, SCREENH_HEIGHT))
/** 机型 */
#define IS_IPHONE_4              (kScreen_Max_Length == 480.0)
#define IS_IPHONE_5_OR_LESS      (kScreen_Max_Length <= 568.0)
#define IS_IPHONE_6_OR_MORE      (kScreen_Max_Length >= 667.0)
#define IS_IPHONE_5              (kScreen_Max_Length == 568.0)
#define IS_IPHONE_6_OR_7         (kScreen_Max_Length == 667.0)
#define IS_IPHONE_6P_OR_7R       (kScreen_Max_Length == 736.0)
#define IS_IPHONE_X              (kScreen_Max_Length > 736.0)
//安全区域高度
#define TabbarSafeBottomMargin     (IS_IPHONE_X ? 34.f : 0.f)
/** 导航以及Tabbar高度 */
#define kNaviHeight              (IS_IPHONE_X?88:64)
#define kTabbarHeight            (IS_IPHONE_X?83:49)
#define kScreenBottom            (IS_IPHONE_X?34:0)
#define kWIDTH_RATIO              (CGRectGetWidth([[UIScreen mainScreen] bounds]) / 375.0)
#define kHEIGHT_RATIO             (CGRectGetHeight([[UIScreen mainScreen] bounds]) / 667.0)
#define kAutoWidth(width)         kWIDTH_RATIO*width
#define kAutoHeight(height)       kHEIGHT_RATIO*height
#define kAutoFont(font)           kWIDTH_RATIO*font


//获取系统版本
#define IOS_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//判断 iOS 8 或更高的系统版本
#define IOS_VERSION_8_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)? (YES):(NO))

//16.沙盒目录文件
//获取temp
#define kPathTemp NSTemporaryDirectory()

//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

//17.GCD 的宏定义
//GCD - 一次性执行
#define kDISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);

//GCD - 在Main线程上运行
#define kDISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

//GCD - 开启异步线程
#define kDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);

#define NavigationBarHiddenYES [self.navigationController setNavigationBarHidden:YES animated:YES];

#define NavigationBarHiddenNO [self.navigationController setNavigationBarHidden:NO animated:YES];

#define APPDelegate [UIApplication sharedApplication].delegate

#define SaveToUserDefaults(key,value) [[NSUserDefaults standardUserDefaults] setObject:value forKey:key]

#define GetFromUserDefaults(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]

#define RemoveUserDefaults(key) [[NSUserDefaults standardUserDefaults] removeObjectForKey:key]

#define StrNotEmpty(str) (str != nil && ![str isEqualToString:@""] && [str length] != 0)
#endif /* HLCommonDefine_h */
