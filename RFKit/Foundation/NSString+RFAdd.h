//
//  NSString+RFAdd.h
//  RFKitDemo
//
//  Created by rocky on 16/7/20.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (RFAdd)

#pragma - 哈希
//生成MD5值
+(NSString *)md5HexDigest:(NSString *)string;

// 根据字符串计算高度
- (CGFloat)heightForFont:(UIFont *)font width:(CGFloat)width;


#pragma - 格式化
// 价格千位符
+ (NSString *)thousandSeparatorWithPrice:(NSString *)price;

// 清除价格千位符
+ (NSString *)nothousandSeparatorWithPrice:(NSString *)price;

//格式化银行卡号(4位一空格)
+ (NSString *)formatCardNumber:(NSString *)cardNum;

//根据金额得到相应的字符串 两位小数
+ (NSString *)moneyToString:(NSString *)money;

//根据金额得到相应的字符串 整数
+ (NSString *)moneyToNumString:(NSString *)money;


#pragma - 正则判断
// 判断手机号
+ (BOOL)isPhoneNumber:(NSString *)phone;

// 判断邮箱
+ (BOOL)isEmail:(NSString *)email;

//判断字母和数字
+ (BOOL)isNumAndAlphabet:(NSString *)strValue;

//数字
+ (BOOL)isNum:(NSString *)strValue;

//字母
+ (BOOL)isAlphabet:(NSString *)strValue;

// 是否为空 nil, @"", @"  ", @"\n" will Returns NO; otherwise Returns YES.
- (BOOL)isNotBlank;










@end
