//
//  Macros.h
//  WMall
//
//  Created by tom on 2018/10/4.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#ifndef SystemMacros_h
#define SystemMacros_h


#ifdef DEBUG
#define DEBUGLog(format, ...) printf("[DEBUG] %s [第%d行] %s \n",  __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define DEBUGLog(__FORMAT__, ...)
#endif


//字符串是否为空
#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))
//数组是否为空
#define IsArrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref) count] == 0))


//背景色
#define BACKGROUND_COLOR @"#FAF8F6"
#define COMMON_COLOR @"#64B0D0"
//字体颜色
#define DEEP_COLOR @"#333333"
#define LIGHT_COLOR @"#C7C7CD"


//图标：标签栏按钮
#define ICON_TAB_BAR_ITEM_HOME_NORMAL            	@"tabr_01_up"
#define ICON_TAB_BAR_ITEM_HOME_SELECT            	@"tabr_01_down"
#define ICON_TAB_BAR_ITEM_CLASSIFY_NORMAL           @"tabr_02_up"
#define ICON_TAB_BAR_ITEM_CLASSIFY_SELECT           @"tabr_02_down"
#define ICON_TAB_BAR_ITEM_SHOPPING_NORMAL         	@"tabr_04_up"
#define ICON_TAB_BAR_ITEM_SHOPPING_SELECT         	@"tabr_04_down"
#define ICON_TAB_BAR_ITEM_PERSON_NORMAL         	@"tabr_05_up"
#define ICON_TAB_BAR_ITEM_PERSON_SELECT         	@"tabr_05_down"


#define USER_DEFAULT [NSUserDefaults standardUserDefaults]

//弱引用
#define WEAKSELF(weakSelf)  __weak __typeof(&*self)weakSelf = self

//机型
#define IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define IPHONE6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

#define IPHONE6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define IPHONEX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

//状态栏
#define StatusBarTopHeight (SCREEN_HEIGHT == 812.0 ? 44 : 20)
//导航栏
#define SafeAreaTopHeight (SCREEN_HEIGHT == 812.0 ? 88 : 64)
//底部
#define TabBarBottomHeight (SCREEN_HEIGHT == 812.0 ? 34 : 0)

#define SafeAreaBottomHeight (SCREEN_HEIGHT == 812.0 ? 83 : 49)

//适配屏幕宽度
#define kWJWidthCoefficient (SCREEN_WIDTH/375.0)
//适配屏幕高度
#define kWJHeightCoefficient (SCREEN_HEIGHT == 812.0 ? 667.0/667.0 : SCREEN_HEIGHT/667.0)
//适配字体大小
#define kWJFontCoefficient (SCREEN_HEIGHT == 812.0 ? 667.0/667.0 : SCREEN_HEIGHT/667.0)

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#endif /* Macros_h */
