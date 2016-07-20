//
//  NSDate+RFAdd.h
//  RFKitDemo
//
//  Created by rocky on 16/7/20.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (RFAdd)
@property (nonatomic, readonly) NSInteger year; ///< Year component
@property (nonatomic, readonly) NSInteger month; ///< Month component (1~12)
@property (nonatomic, readonly) NSInteger day; ///< Day component (1~31)
@property (nonatomic, readonly) NSInteger hour; ///< Hour component (0~23)
@property (nonatomic, readonly) NSInteger minute; ///< Minute component (0~59)
@property (nonatomic, readonly) NSInteger second; ///< Second component (0~59)
@property (nonatomic, readonly) NSInteger nanosecond; ///< Nanosecond component
@property (nonatomic, readonly) NSInteger weekday; ///< Weekday component (1~7, first day is based on user setting)
@property (nonatomic, readonly) NSInteger quarter; ///< Quarter component
@property (nonatomic, readonly) NSInteger weekOfMonth; /// 本月的第几周
@property (nonatomic, readonly) NSInteger weekOfYear; /// 本年第几周

// UTC标准时间转换为NSDate
+ (NSDate *)stringToNSDateWithUTCString:(NSString *)UTCString;

// NSDate转换为字符串
+ (NSString *)stringWithDate:(NSDate *)date format:(NSString *)format;
@end
