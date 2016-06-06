//
//  DateUtil.h
//  futongdai
//
//  Created by 熊彬 on 16/3/9.
//  Copyright © 2016年 OFIM. All rights reserved.
//


#import <Foundation/Foundation.h>

#define ONE_DAY_SECOND (24*60*60)

@interface DateUtil : NSObject

+(NSString*)formatDate: (NSDate*)date datePattern:(NSString*)datePattern;
+(NSDate*)getDateFromStr: (NSString*)dateStr datePattern:(NSString*)datePattern;
+(NSDate *)getDateFromLongValueStr:(NSString *)dateStr;

/*!
 @method
 @abstract 得到日期对象的年份值
 @discussion
 @param date 日期对象
 @result 年份
 */
+(NSInteger)getDateYear:(NSDate *)date;

+(NSString *)getStrMilSecondFrom1970:(NSDate *)date;

/*!
 @method
 @abstract 得到日期对象的日期值
 @discussion
 @param date 日期对象
 @result 日期值
 */
+(NSInteger)getDateDay:(NSDate *)date;

/*!
 @method
 @abstract 得到日期对象的星期字符，如“一”，“二”，。。。“六”，“日”
 @discussion 周日为一周的第一天
 @param date 日期对象
 @result 星期值字符
 */
+(NSString *)getDateWeekDayStr:(NSDate *)date;

/*!
 @method
 @abstract 某个日期的前一天的号数
 @discussion
 @param date 日期对象
 @result 前一天的日期值
 */
+(NSInteger)getOneDayBeforeDayWithDate:(NSDate *)date;


/*!
 @method
 @abstract 某个日期的前一天的日期
 @discussion
 @param date 日期对象
 @result 前一天的日期对象
 */
+(NSDate *)getOneDayBeforeDateWithDate:(NSDate *)date;

/*!
 @method
 @abstract 通过年月日时分秒来得到一个日期对象
 @discussion
 @param year,month,day,hour,min,sec 年月日时分秒的值
 @result 前一天的日期对象
 */
+(NSDate *)makeDateWith:(int)year month:(int)month day:(int)day hour:(int)hour min:(int)min sec:(int)sec;

/*!
 @method
 @abstract 得到当天某点某分的日期对象
 @discussion
 @param clockNum,min 时分值
 @result 日期对象
 */
+(NSDate *)makeTodayClockDateInHour:(int)clockNum min:(int)min;

+(NSDate *)makeDateClockDate:(NSDate *)date InHour:(int)clockNum min:(int)min;
+(NSDate *)getSomeDaysAfterDateFromDate:(NSDate *)date days:(NSInteger)days;

+(NSInteger)getDaysBetweenTodayToMonthDay:(NSInteger)day autoNextMonth:(BOOL)autoNextMonth;
//+(NSDate *)getSomeDaysAfterDateFromDate:(NSDate *)date days:(NSInteger)days;
//+(NSDate *)makeDateClockDate:(NSDate *)date InHour:(int)clockNum min:(int)min;

+(NSDate *)getNextMonthWithSameDay:(NSDate *)date;


/*!
 @method
 @abstract 得到当前的时间，YYYY-MM-dd格式显示
 @discussion
 @param clockNum,min 时分值
 @result 日期对象
 */
+ (NSString *)getTodayDate;

/*!
 @method
 @abstract 得到时间显示格式字符串，如 10分钟内显示成刚刚，10-60分钟内显示成xx分钟前，等
 @discussion
 @param clockNum,min 时分值
 @result 日期对象
 */
+ (NSString *)getShowTimeStrWithTime:(NSDate *)date;

/**
 *  获取时间戳
 *
 */
+ (NSString *)getTimestamp;

@end
