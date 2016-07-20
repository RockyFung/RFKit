//
//  NSDate+RFAdd.m
//  RFKitDemo
//
//  Created by rocky on 16/7/20.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

#import "NSDate+RFAdd.h"

@implementation NSDate (RFAdd)

- (NSInteger)year {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] year];
}

- (NSInteger)month {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self] month];
}

- (NSInteger)day {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self] day];
}

- (NSInteger)hour {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:self] hour];
}

- (NSInteger)minute {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:self] minute];
}

- (NSInteger)second {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] second];
}

- (NSInteger)nanosecond {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] nanosecond];
}

- (NSInteger)weekday {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:self] weekday];
}

- (NSInteger)quarter {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter fromDate:self] quarter];
}
- (NSInteger)weekOfMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfMonth fromDate:self] weekOfMonth];
}

- (NSInteger)weekOfYear {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekOfYear fromDate:self] weekOfYear];
}


// UTC标准时间转换为NSDate
+(NSDate *)stringToNSDateWithUTCString:(NSString *)UTCString{
    //    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    //    [format setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"]; // "2016-05-12T16:46:02.000+08:00"
    //    NSDate *fromdate=[format dateFromString:UTCString];
    //    return fromdate;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //输入格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSZ"];
    NSTimeZone *localTimeZone = [NSTimeZone localTimeZone];
    [dateFormatter setTimeZone:localTimeZone];
    
    NSDate *dateFormatted = [dateFormatter dateFromString:UTCString];
    //输出格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:dateFormatted];
    return [dateFormatter dateFromString:dateString];
}

// NSDate转换为字符串
+ (NSString *)stringWithDate:(NSDate *)date format:(NSString *)format{
    NSDateFormatter* formatter  = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString* string  = [formatter stringFromDate:date];
    return string;
}
@end
