//
//  CommonUtil.m
//  WMall
//
//  Created by tom on 2018/10/5.
//  Copyright © 2018年 kuaikan. All rights reserved.
//

#import "CommonUtil.h"
#import <sys/utsname.h>

@implementation CommonUtil

#pragma mark - 判断是不是有新的版本
+ (BOOL)isFirstBuildVersion {
	NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
	if ([defaults objectForKey:@"Vesion"]) {
		
		NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
		NSString *systemVesion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
		
		BOOL isFirstV = [systemVesion isEqualToString:[defaults objectForKey:@"Vesion"]];
		//不论是不是当前版本 都存入新值
		[defaults setObject:systemVesion forKey:@"Vesion"];
		[defaults synchronize];
		
		//比较存入的版本号是否相同 如果相同则进入tabBar页面否则进入滚动视图
		if (isFirstV) {
			return NO;
		}
		return YES;
	}
	
	NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
	NSString *systemVesion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
	[defaults setObject:systemVesion forKey:@"Vesion"];
	[defaults synchronize];
	
	return YES;
}


#pragma mark - 判断网络状态
+ (BOOL)hasNetwork {
	
	Reachability *reachability = [Reachability reachabilityWithHostName:@"www.apple.com"];
	if ([reachability currentReachabilityStatus] == NotReachable) {
		return NO;
	} else {
		return YES;
	}
}


#pragma mark - 获取6位随机数
+ (NSString *)getRandomNumber {
	NSTimeInterval random = [NSDate timeIntervalSinceReferenceDate];
	NSString *randomString = [NSString stringWithFormat:@"%.6f",random];
	NSString *code = [[randomString componentsSeparatedByString:@"."]objectAtIndex:1];
	return code;
}


#pragma mark - 判断合法的电话号码
+ (BOOL)isMobileNumber:(NSString *)mobileNumber {
	
	if(mobileNumber.length == 11){
		//手机号码
		// NSString *MOBILE = @"^1[3578]\\d{5,9}$";
		
		NSString *MOBILE = @"^(13[0-9]|15([0-9])|14[0-9]|17[0-9]|18[0-9])\\d{8}$";
		
		NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
		
		if ([regextestmobile evaluateWithObject:mobileNumber] == YES) {
			return YES;
		}else{
			return NO;
		}
	}else{
		return NO;
	}
}

#pragma mark - 判断只包含字母或数字
+ (BOOL)containsNumberLetter:(NSString *)numberLetterString {
	
	NSString *regex = @"[a-zA-Z_0-9]+";
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
	if([predicate evaluateWithObject:numberLetterString] == YES){
		return YES;
	}else{
		return NO;
	}
}

#pragma mark - 获取当前时间戳字符串
+ (NSString *)longLongTime {
	NSDate *date = [NSDate date];
	NSInteger time = [[NSString stringWithFormat:@"%f",[date timeIntervalSince1970]] integerValue];
	return [NSString stringWithFormat:@"%ld",time];
}

#pragma mark - 时间戳转换为时间
+ (NSString *)timeStamp:(NSInteger)time {
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateStyle:NSDateFormatterMediumStyle];
	[formatter setTimeStyle:NSDateFormatterShortStyle];
	[formatter setDateFormat:@"yyyy-MM-dd"];
	NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
	[formatter setTimeZone:timeZone];
	
	NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:time];
	NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
	return confromTimespStr;
}

#pragma mark - 获取当前版本号
+ (NSString *)getCurrentSystemVersion {
	
	//获取当前所有信息字典
	NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
	//获取app当前版本号
	NSString *systemVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
	
	NSString *versionCode = [NSString stringWithFormat:@"%d",(int)([systemVersion floatValue]*10)];
	return versionCode;
}


#pragma mark - 获取手机型号
+ (NSString *)iphoneType {
	struct utsname systemInfo;
	uname(&systemInfo);
	NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
	
	if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 2G";
	if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
	if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
	if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
	if ([platform isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
	if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
	if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
	if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
	if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
	if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
	if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (Global)";
	if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5S (GSM)";
	if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5S (Global)";
	if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus (A1522/A1524)";
	if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6 (A1549/A1586)";
	if ([platform isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
	if ([platform isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
	if ([platform isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
	if ([platform isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
	if ([platform isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
	if ([platform isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
	if ([platform isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
	if ([platform isEqualToString:@"iPhone10,1"])   return @"iPhone 8";
	if ([platform isEqualToString:@"iPhone10,4"])   return @"iPhone 8";
	if ([platform isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus";
	if ([platform isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus";
	if ([platform isEqualToString:@"iPhone10,3"])   return @"iPhone X";
	if ([platform isEqualToString:@"iPhone10,6"])   return @"iPhone X";
	return @"";
}

#pragma mark - 计算字体的高
+ (CGFloat)dc_calculateTextHeightWithText:(NSString *)text textFont:(NSInteger)textFont textMaxW:(CGFloat)textMaxW {
	
	CGSize textMaxSize = CGSizeMake(textMaxW, MAXFLOAT);
	
	CGFloat textHeight = [text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:textFont]} context:nil].size.height;
	
	return textHeight;
}

#pragma mark - 首行缩进
+ (void)dc_setUpLabel:(UILabel *)label content:(NSString *)content indentationFortheFirstLin:(CGFloat)emptylen {
	NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
	paraStyle.firstLineHeadIndent = emptylen;//首行缩进
	NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:content attributes:@{NSParagraphStyleAttributeName:paraStyle}];
	
	label.attributedText = attrText;
}

#pragma mark - 下划线
+ (void)dc_setUpAcrossPartingLine:(UIView *)view color:(UIColor *)color {
	
	UIView *cellAcrossPartingLine = [[UIView alloc] init];
	cellAcrossPartingLine.backgroundColor = color;
	[view addSubview:cellAcrossPartingLine];
	
	[cellAcrossPartingLine mas_makeConstraints:^(MASConstraintMaker *make) {
		
		make.left.mas_equalTo(view);
		make.bottom.mas_equalTo(view);
		make.size.mas_equalTo(CGSizeMake(view.dc_width, 1));
		
	}];
}

#pragma mark - 竖线
+ (void)dc_setUpLongLine:(UIView *)view color:(UIColor *)color hightRatio:(CGFloat)ratio {
	
	if (ratio == 0) { // 默认1
		ratio = 1;
	}
	UIView *cellLongLine = [[UIView alloc] init];
	cellLongLine.backgroundColor = color;
	[view addSubview:cellLongLine];
	
	[cellLongLine mas_makeConstraints:^(MASConstraintMaker *make) {
		
		make.right.mas_equalTo(view);
		make.centerY.mas_equalTo(view);
		make.size.mas_equalTo(CGSizeMake(1, view.dc_height * ratio));
	}];
}

#pragma mark - 设置不同字体颜色
+ (void)stringChangeColorLabel:(UILabel *)label range:(NSRange)range color:(UIColor *)textColor {
	
	NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:label.text];
	//设置文字颜色
	[str addAttribute:NSForegroundColorAttributeName value:textColor range:range];
	label.attributedText = str;
}


+ (id)dc_chageControlCircularWith:(id)anyControl setCornerRadius:(NSInteger)radius setBorderWidth:(NSInteger)width setBorderColor:(UIColor *)borderColor canMasksToBounds:(BOOL)can {
	
	CALayer *icon_layer = [anyControl layer];
	[icon_layer setCornerRadius:radius];
	[icon_layer setBorderWidth:width];
	[icon_layer setBorderColor:[borderColor CGColor]];
	[icon_layer setMasksToBounds:can];
	
	return anyControl;
}


@end
