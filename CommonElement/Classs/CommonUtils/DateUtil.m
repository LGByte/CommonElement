//
//  DateUtil.m
//  futongdai
//
//  Created by 熊彬 on 16/3/9.
//  Copyright © 2016年 OFIM. All rights reserved.
//

#import "DateUtil.h"

@implementation DateUtil

+(NSString*)formatDate: (NSDate*)date datePattern:(NSString*)datePattern{
    
    if(date == nil){
        return @"";
    }
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:datePattern];
    NSString* ret = [formatter stringFromDate:date];
    return ret;
}

+(NSDate*)getDateFromStr: (NSString*)dateStr datePattern:(NSString*)datePattern{
    if(!dateStr || [@"" isEqualToString:dateStr]){
        return nil;
    }
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:datePattern];
    return [dateFormat dateFromString:dateStr];
}

+(NSDate *)getDateFromLongValueStr:(NSString *)dateStr{
    //NSLog(@"nowMilSecond:%f, milSecond:%@",[[NSDate date]timeIntervalSince1970]*1000,dateStr);
    return [NSDate dateWithTimeIntervalSince1970:[dateStr longLongValue]/1000];
}

+(NSString *)getStrMilSecondFrom1970:(NSDate *)date{
    return [NSString stringWithFormat:@"%.0f",[date timeIntervalSince1970]*1000];
}

+(NSInteger)getDateYear:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit ;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date];
    int year = [dateComponent year];
    return year;
}

+(NSInteger)getDateDay:(NSDate *)date{
    if(!date){
        return -1;
    }
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSDayCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date];
    int day = [dateComponent day];
    return day;
}


//得到当前月离某一号还有几天，如果当前超过某一号，自动计算到下一个月这一天的天数
+(NSInteger)getDaysBetweenTodayToMonthDay:(NSInteger)day autoNextMonth:(BOOL)autoNextMonth{
    NSInteger todayDay = [self getDateDay:[NSDate date]];
    if(day >= todayDay){
        return day - todayDay;
    }else{
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *nowcomps = [[NSDateComponents alloc] init];
        NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
        nowcomps = [calendar components:unitFlags fromDate:[NSDate date]];
        
        NSDateComponents *comps = [[NSDateComponents alloc]init];
        [comps setYear:nowcomps.year];
        [comps setMonth:nowcomps.month + 1];
        [comps setDay:day];
        NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate *nextMonthDayDate = [gregorian dateFromComponents:comps];
        
        NSTimeInterval daysTimeInterval = [nextMonthDayDate timeIntervalSinceDate:[NSDate date]];
        return (daysTimeInterval / (3600*24)) +1;
    }
}

+(NSString *)getDateWeekDayStr:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSWeekdayCalendarUnit;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date];
    
    NSInteger day = [dateComponent weekday];
    NSString *weekDayStr = @"";
    switch (day) {
        case 1:
            weekDayStr = @"日";
            break;
        case 2:
            weekDayStr = @"一";
            break;
        case 3:
            weekDayStr = @"二";
            break;
        case 4:
            weekDayStr = @"三";
            break;
        case 5:
            weekDayStr = @"四";
            break;
        case 6:
            weekDayStr = @"五";
            break;
        case 7:
            weekDayStr = @"六";
            break;
            
        default:
            break;
    }
    
    return weekDayStr;
}

+(NSInteger)getOneDayBeforeDayWithDate:(NSDate *)date{
    
    NSTimeInterval Interval = [date timeIntervalSince1970];
    NSTimeInterval oneDayBeforeInterval = Interval - ONE_DAY_SECOND;
    NSDate *oneDayBeforeDate = [NSDate dateWithTimeIntervalSince1970:oneDayBeforeInterval];
    int dayBefore = [self getDateDay:oneDayBeforeDate];
    return dayBefore;
}

+(NSDate *)getNextMonthWithSameDay:(NSDate *)date{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *nowcomps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit;
    nowcomps = [calendar components:unitFlags fromDate:date];
    
    NSDateComponents *comps = [[NSDateComponents alloc]init];
    if(nowcomps.month == 12){
        [comps setYear:nowcomps.year + 1];
        [comps setMonth:1];
    }else{
        [comps setYear:nowcomps.year];
        [comps setMonth:nowcomps.month + 1];
    }
    [comps setDay:nowcomps.day];
    [comps setHour:nowcomps.hour];
    [comps setMinute:nowcomps.minute];
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    return [gregorian dateFromComponents:comps];
}


+(NSDate *)getOneDayBeforeDateWithDate:(NSDate *)date{
    NSTimeInterval Interval = [date timeIntervalSince1970];
    NSTimeInterval oneDayBeforeInterval = Interval - ONE_DAY_SECOND;
    NSDate *oneDayBeforeDate = [NSDate dateWithTimeIntervalSince1970:oneDayBeforeInterval];
    return oneDayBeforeDate;
}


+(NSDate *)makeDateWith:(int)year month:(int)month day:(int)day hour:(int)hour min:(int)min sec:(int)sec{
    NSDateComponents *comps = [[NSDateComponents alloc]init];
    [comps setYear:year];
    [comps setMonth:month];
    [comps setDay:day];
    [comps setHour:hour];
    [comps setMinute:min];
    [comps setSecond:sec];
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *tempDate = [gregorian dateFromComponents:comps];
     return tempDate;
}

+(NSDate *)makeTodayClockDateInHour:(int)clockNum min:(int)min{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now;
    NSDateComponents *nowcomps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    now=[NSDate date];
    nowcomps = [calendar components:unitFlags fromDate:now];
    
    NSDateComponents *comps = [[NSDateComponents alloc]init];
    [comps setYear:nowcomps.year];
    [comps setMonth:nowcomps.month];
    [comps setDay:nowcomps.day];
    [comps setHour:clockNum];
    [comps setMinute:min];
    [comps setSecond:0];
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    return [gregorian dateFromComponents:comps];
}


+(NSDate *)makeDateClockDate:(NSDate *)date InHour:(int)clockNum min:(int)min{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now;
    NSDateComponents *nowcomps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    now=date;
    nowcomps = [calendar components:unitFlags fromDate:now];
    
    NSDateComponents *comps = [[NSDateComponents alloc]init];
    [comps setYear:nowcomps.year];
    [comps setMonth:nowcomps.month];
    [comps setDay:nowcomps.day];
    [comps setHour:clockNum];
    [comps setMinute:min];
    [comps setSecond:0];
    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    return [gregorian dateFromComponents:comps];
}



+(NSDate *)getSomeDaysAfterDateFromDate:(NSDate *)date days:(NSInteger)days{
    NSTimeInterval Interval = [date timeIntervalSince1970];
    NSTimeInterval intervals = Interval + ONE_DAY_SECOND * days;
    NSDate *oneDayBeforeDate = [NSDate dateWithTimeIntervalSince1970:intervals];
    return oneDayBeforeDate;
}




+ (NSString *)getTodayDate
{
    return [self formatDate:[NSDate date] datePattern:@"yyyy-MM-dd"];
}

+ (NSString *)getShowTimeStrWithTime:(NSDate *)date
{
    if(!date || ![date isKindOfClass:[NSDate class]]){
        return @"--";
    }
    
    if([date compare:[NSDate dateWithTimeIntervalSinceNow:-10*60]] == NSOrderedDescending){
        return @"刚刚";
    }else if([date compare:[NSDate dateWithTimeIntervalSinceNow:-60*60]] == NSOrderedDescending){
        NSTimeInterval interval = -[date timeIntervalSinceDate:[NSDate date]];
        return [NSString stringWithFormat:@"%.0f分钟前",interval/60.0f];
    }else if([date compare:[NSDate dateWithTimeIntervalSinceNow:-24*60*60]] == NSOrderedDescending){
        NSTimeInterval interval = -[date timeIntervalSinceDate:[NSDate date]];
        return [NSString stringWithFormat:@"%.0f小时前",interval/(60*60.0f)];
    }else if([date compare:[NSDate dateWithTimeIntervalSinceNow:-48*60*60]] == NSOrderedDescending){
        return @"昨天";
    }else if([date compare:[NSDate dateWithTimeIntervalSinceNow:-72*60*60]] == NSOrderedDescending){
        return @"前天";
    }else {
        return [self formatDate:date datePattern:@"MM/dd"];
    }
}

+ (NSString *)getTimestamp
{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval timestampValue = [dat timeIntervalSince1970] * 1000 ;
    NSString *timestamp = [NSString stringWithFormat:@"%0.3f", timestampValue];
    return timestamp;

}

@end
