//
//  CommonUtils+Custom.h
//  futongdai
//
//  Created by 熊彬 on 16/3/9.
//  Copyright © 2016年 OFIM. All rights reserved.
//

#import "CommonUtils.h"


@interface CommonUtils (Custom)

//NSUserDefaults存取操作
+(void)saveBoolValueInUD:(BOOL)value forKey:(NSString *)key;
+(void)saveValueInUD:(id)value forKey:(NSString *)key;
+(void)saveStrValueInUD:(NSString *)str forKey:(NSString *)key;
+(void)saveDicValueInUD:(NSDictionary *)dic forKey:(NSString *)key;
+(void)saveDateValueInUD:(NSDate *)date forKey:(NSString *)key;
+(void)saveIntValueInUD:(NSInteger)value forKey:(NSString *)key;
+(void)removeValueInUDWithKey:(NSString *)key;
+(id)getValueInUDWithKey:(NSString *)key;
+(NSDate *)getDateValueInUDWithKey:(NSString *)key;
+(NSString *)getStrValueInUDWithKey:(NSString *)key;
+(NSInteger )getIntValueInUDWithKey:(NSString *)key;
+(NSDictionary *)getDicValueInUDWithKey:(NSString *)key;
+(BOOL)getBoolValueInUDWithKey:(NSString *)key;


+(NSString *)getDistanceStr:(NSNumber *)distanceNum;

+(NSString *)getGenderFrom18CardID:(NSString *)cardId;


+(UIColor *)getColor:(NSString*)hexColor;
+(UIColor *)getCommonBgColor;
+(UIColor *)getCommonBorderColor;
+(UIColor *)getCommonDarkGrayColor;
+(UIColor *)getCommonLightGrayColor;
+(UIColor *)getCommonBlueColor;
+(UIColor *)getCommonNavBlueColor;
+(UIColor *)getCommonNavBarColor;
+(UIColor *)getCommonTagBgColor;
+(UIColor *)getCommonSepLineColor;
+(UIColor *)getCommonGreenColor;
+(UIColor *)getCommonNewGreenColor;
+(UIColor *)getCommonNewLightGrayColor;
+(UIColor *)getNewCommonBgColor;
+(UIColor *)getCommonPinkColor;
+(UIColor *)getCommonOrangeColor;


//判断银行卡
+ (BOOL) checkCardNo:(NSString*) cardNo;
//判断腾讯qq
+ (BOOL)validateQQ:(NSString *)QQ;
//判断汉字
+ (BOOL)validateChineseCharacters:(NSString *)Characters;
+ (BOOL)validateIdentityCard:(NSString *)identityCard;
+ (BOOL)validatePassword:(NSString *)passWord;
+ (BOOL)validateNickname:(NSString *)nickname;

+(NSString *)getIdentifierName:(NSString *)idType;
+(NSString *)getGenderName:(NSString *)genderType;

#pragma mark - add by lam
/// string --> int
+ (NSInteger)trimIntValue:(NSString *)sender;
+ (NSString *)trimStringValue:(NSString *)sender;

+(BOOL)isValidatePhoneNum1:(NSString *)phone;

/**
 *  获取高度
 *
 *  @param content 字符串
 *  @param width   设置显示的宽度
 *  @param size    字体大小
 *
 *  @return 返回高度
 */
+ (CGFloat)getHeightFromString:(NSString *)content ExpectWidth:(CGFloat)width FontSize:(UIFont *)font;

#pragma mark - 归档和反归档
+ (void) keyedArchiverObject:(id)object ForKey:(NSString *)key ToFile:(NSString *)path;
+ (NSArray *) keyedUnArchiverForKey:(NSString *)key FromFile:(NSString *)path;


+ (NSString *)fileDocDir;
+ (NSString *)pathFileDocDir:(NSString *)path;
+ (BOOL)fileExistAtPath:(NSString *)path;
+ (BOOL)fileCreateDir:(NSString *)path;
+ (BOOL)fileWriteAtPath:(NSString *)path data:(NSData *)data;
+ (BOOL)fileDel:(NSString *)path;

+(NSString *)saveHeaderCache:(UIImage *)headerImg;

+ (BOOL)isStrEmpty:(NSString*)string;


@end
