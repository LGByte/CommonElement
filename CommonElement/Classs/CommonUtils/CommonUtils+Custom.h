//
//  CommonUtils+Custom.h
//  futongdai
//
//  Created by 熊彬 on 16/3/9.
//  Copyright © 2016年 OFIM. All rights reserved.
//

#import "CommonUtils.h"


@interface CommonUtils (Custom)

+(NSString *)getServerAddr;
+(NSString *)getServerWWWAddr;

//NSUserDefaults存取操作
+(void)saveBoolValueInUD:(BOOL)value forKey:(NSString *)key;
+(void)saveValueInUD:(id)value forKey:(NSString *)key;
+(void)saveStrValueInUD:(NSString *)str forKey:(NSString *)key;
+(void)saveDicValueInUD:(NSDictionary *)dic forKey:(NSString *)key;
+(void)saveDateValueInUD:(NSDate *)date forKey:(NSString *)key;
+(void)saveIntValueInUD:(NSInteger)value forKey:(NSString *)key;
+(void)removeValueInUDWithKey:(NSString *)key;

+(UIColor *)getColor:(NSString*)hexColor;

+(id)getValueInUDWithKey:(NSString *)key;
+(NSDate *)getDateValueInUDWithKey:(NSString *)key;
+(NSString *)getStrValueInUDWithKey:(NSString *)key;
+(NSInteger )getIntValueInUDWithKey:(NSString *)key;
+(NSDictionary *)getDicValueInUDWithKey:(NSString *)key;
+(BOOL)getBoolValueInUDWithKey:(NSString *)key;

+(BOOL)isLogin;

+(NSAttributedString *)getAttributeBBSNameLabel:(NSString *)userName time:(NSString *)timeStr isTop:(BOOL)isTop;


+(NSString *)getDistanceStr:(NSNumber *)distanceNum;

+(NSString *)getBirthFrom18CardID:(NSString *)cardId;
+(NSString *)getGenderFrom18CardID:(NSString *)cardId;

+ (CGFloat)heightForLineWidth:(CGFloat)width font:(UIFont *)font sourceStr:(NSString *)str;

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


+(NSString *)getMyCityInfo;
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
+ (CGFloat)getHeightFromString:(NSString *)content ExpectWidth:(CGFloat)width FontSize:(CGFloat)size;

#pragma mark - 归档和反归档
+ (void) keyedArchiverObject:(id)object ForKey:(NSString *)key ToFile:(NSString *)path;
+ (NSArray *) keyedUnArchiverForKey:(NSString *)key FromFile:(NSString *)path;


+(void)setImageWithImageName:(NSString *)imageName imageView:(UIImageView *)imageView;
+(void)setImageWithImageName:(NSString *)imageName imageView:(UIImageView *)imageView defaultImage:(UIImage *)defaultImage;

+(NSAttributedString *)getAttributeCommentStr:(NSString *)orignalComment;
+(NSAttributedString *)getAttributeCommentUseFullStr:(NSString *)countStr;
+(NSAttributedString *)getAttributePointStr:(NSString *)point money:(NSString *)money isBold:(BOOL)isBold;
+(NSAttributedString *)getAttributeCustomBaoMoneyStr:(NSString *)money;
+(NSAttributedString *)getAttributeConfirmStatement;
+(NSAttributedString *)getAttributeCoinStr:(NSString *)point;
+(NSAttributedString *)getChargeViewAttributePointStr:(NSString *)point money:(NSString *)money;
+(NSString *)getSavedCityName;
+(NSAttributedString *)getAttributeDiscountStr:(NSString *)discount;
+(NSAttributedString *)getAttributePriceStr:(NSString *)price;
+(NSAttributedString *)getAttributeLeftNumStr:(NSString *)numStr;

+ (NSString *)fileDocDir;
+ (NSString *)pathFileDocDir:(NSString *)path;
+ (BOOL)fileExistAtPath:(NSString *)path;
+ (BOOL)fileCreateDir:(NSString *)path;
+ (BOOL)fileWriteAtPath:(NSString *)path data:(NSData *)data;
+ (BOOL)fileDel:(NSString *)path;

+(NSString *)saveHeaderCache:(UIImage *)headerImg;

+ (BOOL)isStrEmpty:(NSString*)string;


@end
