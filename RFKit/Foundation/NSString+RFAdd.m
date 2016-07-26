//
//  NSString+RFAdd.m
//  RFKitDemo
//
//  Created by rocky on 16/7/20.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

#import "NSString+RFAdd.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (RFAdd)

//生成MD5值
+(NSString *)md5HexDigest:(NSString *)string{
    const char *cStr = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

// 价格千位符
+ (NSString *)thousandSeparatorWithPrice:(NSString *)price{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    double value = [price doubleValue];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    return [formatter stringFromNumber:@(value)];
}

// 清除价格千位符
+ (NSString *)nothousandSeparatorWithPrice:(NSString *)price{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *investNum = [formatter numberFromString:price];
    return [NSString stringWithFormat:@"%@",investNum];
}

//格式化银行卡号
+ (NSString *)formatCardNumber:(NSString *)cardNum
{
    NSNumber *number = @([cardNum longLongValue]);
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    [formatter setUsesGroupingSeparator:YES];
    [formatter setGroupingSize:4];
    [formatter setGroupingSeparator:@" "];
    
    NSString *returnStr = [formatter stringFromNumber:number];
    
    return [returnStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

// 根据字符串计算高度
- (CGFloat)heightForFont:(UIFont *)font width:(CGFloat)width {
    CGSize size = [self sizeForFont:font size:CGSizeMake(width, MAXFLOAT) mode:NSLineBreakByWordWrapping];
    return size.height;
}


- (CGSize)sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode {
    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:12];
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableDictionary *attr = [NSMutableDictionary new];
        attr[NSFontAttributeName] = font;
        if (lineBreakMode != NSLineBreakByWordWrapping) {
            NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
            paragraphStyle.lineBreakMode = lineBreakMode;
            attr[NSParagraphStyleAttributeName] = paragraphStyle;
        }
        CGRect rect = [self boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attr context:nil];
        result = rect.size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [self sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    return result;
}



/**
 *  正则判断
 */

// 判断手机号
+ (BOOL)isPhoneNumber:(NSString *)phone {
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188,178
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|7[0-9]|8[0235-9])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188,178
     */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|78[0-9]|8[278])\\d)\\d{7}$";
    /**
     * 中国联通：China Unicom
     * 130,131,132,152,155,156,185,186,176
     */
    NSString * CU = @"^1(3[0-2]|5[256]|76|8[56]|4[0-9])\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133,1349,153,180,189,177
     */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349|77[0-9])\\d{7}$";
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:phone] == YES)
        || ([regextestcm evaluateWithObject:phone] == YES)
        || ([regextestct evaluateWithObject:phone] == YES)
        || ([regextestcu evaluateWithObject:phone] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

// 判断邮箱
+ (BOOL)isEmail:(NSString *)email{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

//判断字母和数字
+ (BOOL)isNumAndAlphabet:(NSString *)strValue
{
    NSString * regex = @"^[A-Za-z0-9]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:strValue];
    return isMatch;
}
+ (BOOL)isNum:(NSString *)strValue
{
    NSString * regex = @"^[0-9]*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:strValue];
    return isMatch;
}
+ (BOOL)isAlphabet:(NSString *)strValue
{
    NSString * regex = @"^[A-Za-z]+$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:strValue];
    return isMatch;
}


- (BOOL)isNotBlank{
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![blank characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}

//根据金额得到相应的字符串 两位小数
+ (NSString *)moneyToString:(NSString *)money
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSString *moneyStr = nil;
    
    if ([money intValue] >= 1000000) {
        float million = [money floatValue] / 1000000.00;
        moneyStr = [NSString stringWithFormat:@"%.2f",million];
        moneyStr = [moneyStr stringByAppendingString:@"百万元"];
    }else if ([money intValue] >= 10000) {
        float tenThousand = [money intValue] / 10000.00;
        moneyStr = [NSString stringWithFormat:@"%.2f",tenThousand];
        
        moneyStr = [moneyStr stringByAppendingString:@"万元"];
    }else{
        float singleDigits = [money floatValue];
        moneyStr = [NSString stringWithFormat:@"%.2f",singleDigits];
        moneyStr = [moneyStr stringByAppendingString:@"元"];
    }
    
    return moneyStr;
}

//根据金额得到相应的字符串 整数
+ (NSString *)moneyToNumString:(NSString *)money
{
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSString *moneyStr = nil;
    
    if ([money intValue] >= 1000000) {
        float million = [money floatValue] / 1000000.00;
        
        moneyStr = [NSString stringWithFormat:@"%.f",million];
        moneyStr = [moneyStr stringByAppendingString:@"百万元"];
    }else if ([money intValue] >= 10000) {
        float tenThousand = [money intValue] / 10000.00;
        moneyStr = [NSString stringWithFormat:@"%.f",tenThousand];
        
        moneyStr = [moneyStr stringByAppendingString:@"万元"];
    }else{
        float singleDigits = [money floatValue];
        moneyStr = [NSString stringWithFormat:@"%.f",singleDigits];
        moneyStr = [moneyStr stringByAppendingString:@"元"];
    }
    
    return moneyStr;
}















@end
