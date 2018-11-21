//
//  CommonUtil.h
//  WMall
//
//  Created by tom on 2018/10/5.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonUtil : NSObject

/* 判断是不是有新的版本 */
+ (BOOL)isFirstBuildVersion;

/* 判断网络状态 */
+ (BOOL)hasNetwork;

/* 判断合法的电话号码 */
+ (BOOL)isMobileNumber:(NSString *)mobileNumber;

/* 判断只包含字母或数字 */
+ (BOOL)containsNumberLetter:(NSString *)numberLetterString;

/* 获取6位随机数 */
+ (NSString *)getRandomNumber;

/* 时间戳转换为时间 */
+ (NSString *)timeStamp:(NSInteger)time;

/* 获取当前时间戳字符串 */
+ (NSString *)longLongTime;

/* 获取当前版本号 */
+ (NSString *)getCurrentSystemVersion;

/* 获取手机型号 */
+ (NSString *)iphoneType;

/* 计算字体的高 */
+ (CGFloat)dc_calculateTextHeightWithText:(NSString *)text textFont:(NSInteger)textFont textMaxW:(CGFloat)textMaxW;

/**
 label首行缩进
 
 @param label label
 @param emptylen 缩进比
 */
+ (void)dc_setUpLabel:(UILabel *)label content:(NSString *)content indentationFortheFirstLin:(CGFloat)emptylen;

/**
 下划线
 
 @param view 下划线
 */
+ (void)dc_setUpAcrossPartingLine:(UIView *)view color:(UIColor *)color;

/**
 竖线
 
 @param view 竖线
 */
+ (void)dc_setUpLongLine:(UIView *)view color:(UIColor *)color hightRatio:(CGFloat)ratio;


/**
 设置不同字体颜色

 @param label label
 @param range 变色范围
 @param textColor 变色颜色
 */
+ (void)stringChangeColorLabel:(UILabel *)label range:(NSRange)range color:(UIColor *)textColor;


/**
 设置按钮的圆角
 
 @param anyControl 控件
 @param radius 圆角度
 @param width 边宽度
 @param borderColor 边线颜色
 @param can 是否裁剪
 @return 控件
 */
+ (id)dc_chageControlCircularWith:(id)anyControl setCornerRadius:(NSInteger)radius setBorderWidth:(NSInteger)width setBorderColor:(UIColor *)borderColor canMasksToBounds:(BOOL)can;

@end
