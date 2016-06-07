//
//  CommonUtils+Custom.m
//  futongdai
//
//  Created by 熊彬 on 16/3/9.
//  Copyright © 2016年 OFIM. All rights reserved.
//

#import "CommonUtils+Custom.h"

@implementation CommonUtils (Custom)


+(void)saveValueInUD:(id)value forKey:(NSString *)key{
    if(!value){
        return;
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setValue:value forKey:key];
    [ud synchronize];
}


+(void)saveIntValueInUD:(NSInteger)value forKey:(NSString *)key{
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setInteger:value forKey:key];
    [ud synchronize];
}

+(void)saveBoolValueInUD:(BOOL)value forKey:(NSString *)key{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:value forKey:key];
    [ud synchronize];
}

+(void)saveStrValueInUD:(NSString *)str forKey:(NSString *)key{
    if(!str){
        return;
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setValue:str forKey:key];
    [ud synchronize];
}


+(void)saveDateValueInUD:(NSDate *)date forKey:(NSString *)key{
    if(!date){
        return;
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setValue:date forKey:key];
    [ud synchronize];
}


+(void)removeValueInUDWithKey:(NSString *)key{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud removeObjectForKey:key];
    [ud synchronize];
}


+ (UIColor *)getColor:(NSString*)hexColor
{
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&red];
    
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]]scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f)green:(float)(green / 255.0f) blue:(float)(blue / 255.0f)alpha:1.0f];
}


+(void)saveDicValueInUD:(NSDictionary *)dic forKey:(NSString *)key{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setValue:dic forKey:key];
    [ud synchronize];
}

+(NSString *)getStrValueInUDWithKey:(NSString *)key{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud valueForKey:key];
}

+(NSInteger )getIntValueInUDWithKey:(NSString *)key{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud integerForKey:key];
}

+(BOOL)getBoolValueInUDWithKey:(NSString *)key{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud boolForKey:key];
}


+(NSDictionary *)getDicValueInUDWithKey:(NSString *)key{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud valueForKey:key];
}


+(NSDate *)getDateValueInUDWithKey:(NSString *)key{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud valueForKey:key];
}

+(id)getValueInUDWithKey:(NSString *)key{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud valueForKey:key];
    
}


+(NSString *)getIdentifierName:(NSString *)idType{
    if([@"10"isEqualToString:idType] || [@"CARDID"isEqualToString:idType]){
        return @"居民身份证";
    }else if([@"PASSPORT"isEqualToString:idType]){
        return @"护照";
    }else if([@"OTHERS"isEqualToString:idType]){
        return @"其他";
    }else{
        return idType;
    }
    
}

+(NSString *)getGenderName:(NSString *)genderType{
    if([@"M"isEqualToString:genderType]){
        return @"男";
    }else if([@"F"isEqualToString:genderType]){
        return @"女";
    }else if([@"O"isEqualToString:genderType]){
        return @"其他";
    }else{
        return genderType;
    }
    
}


+(NSString *)getDistanceStr:(NSNumber *)distanceNum{
    float distance = distanceNum.floatValue;
    
    if(distance < 0.000001){
        return @"-";
    }
    
    if(distance < 1000){
        return [NSString stringWithFormat:@"%dm",(int)distance];
    }else if(distance >= 1000 && distance < 10000){
        return [NSString stringWithFormat:@"%.1fKm",distance/1000.0];
    }else if(distance < 500000){
        return [NSString stringWithFormat:@"%.0fKm",distance/1000.0];
    }else{
        return @">500Km";
    }
}

+(NSString *)getGenderFrom18CardID:(NSString *)cardId{
    NSString *genderStr = @"";
    if(cardId.length >= 17){
        NSString *subStr = [cardId substringWithRange:NSMakeRange(16, 1)];
  
        if(subStr.length == 1){
            if([subStr integerValue]%2 == 0){
                genderStr = @"F";
            }else if([subStr integerValue]%2 == 1){
                genderStr = @"M";
            }else{
                genderStr = @"O";
            }
        }
        
    }
    
    return genderStr;
}



+(UIColor *)getCommonBgColor{
    return [self getColor:@"efeff4"];

}


+(UIColor *)getNewCommonBgColor{
    return [self getColor:@"f2f2f2"];
    
}


+(UIColor *)getCommonPinkColor{
    return [UIColor colorWithRed:250/255.0 green:45/255.0 blue:101/255.0 alpha:1];
    
}
+(UIColor *)getCommonOrangeColor
{
    return [UIColor colorWithRed:250/255.0 green:84/255.0 blue:10/255.0 alpha:1];
}

+(UIColor *)getCommonSepLineColor{
    return [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.2];
}

+(UIColor *)getCommonBorderColor{
    return [self getColor:@"c8c7cc"];
}

+(UIColor *)getCommonDarkGrayColor{
    return [self getColor:@"292828"];
}

+(UIColor *)getCommonLightGrayColor{
    return [self getColor:@"5c5c5c"];
}

+(UIColor *)getCommonBlueColor{
    return [self getColor:@"007aff"];
}

+(UIColor *)getCommonNewGreenColor{
    return [self getColor:@"06c7a5"];
}

+(UIColor *)getCommonNewLightGrayColor{
    return [self getColor:@"08bca0"];
}

+(UIColor *)getCommonNavBlueColor{
    return [UIColor colorWithRed:32/255.0 green:141/255.0 blue:228/255.0 alpha:1.0];
}

+(UIColor *)getCommonTagBgColor{
    return [self getColor:@"f5f3fc"];
}

+(UIColor *)getCommonNavBarColor{
    return [UIColor colorWithRed:62/255.0 green:175/255.0 blue:245/255.0 alpha:1.0];
}

+(UIColor *)getCommonGreenColor{
    return [UIColor colorWithRed:14/155.0 green:153/255.0 blue:12/255.0 alpha:1.0];
}


//身份证号
+ (BOOL)validateIdentityCard:(NSString *)cardNo
{
    if (cardNo.length != 18) {
        return  NO;
    }
    NSArray* codeArray = [NSArray arrayWithObjects:@"7",@"9",@"10",@"5",@"8",@"4",@"2",@"1",@"6",@"3",@"7",@"9",@"10",@"5",@"8",@"4",@"2", nil];
    NSDictionary* checkCodeDic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"0",@"X",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2", nil]  forKeys:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil]];
    
    NSScanner* scan = [NSScanner scannerWithString:[cardNo substringToIndex:17]];
    
    int val;
    BOOL isNum = [scan scanInt:&val] && [scan isAtEnd];
    if (!isNum) {
        return NO;
    }
    int sumValue = 0;
    
    for (int i =0; i<17; i++) {
        sumValue+=[[cardNo substringWithRange:NSMakeRange(i , 1) ] intValue]* [[codeArray objectAtIndex:i] intValue];
    }
    
    NSString* strlast = [checkCodeDic objectForKey:[NSString stringWithFormat:@"%d",sumValue%11]];
    
    if ([strlast isEqualToString: [[cardNo substringWithRange:NSMakeRange(17, 1)]uppercaseString]]) {
        return YES;
    }
    return  NO;
}

//密码
+ (BOOL) validatePassword:(NSString *)passWord
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,15}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}

//昵称
+ (BOOL) validateNickname:(NSString *)nickname
{
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{2,8}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:nickname];
}

//qq号
+ (BOOL)validateQQ:(NSString *)QQ{
    NSString *QQRegex = @"[1-9][0-9]{4,}";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",QQRegex];
    return [passWordPredicate evaluateWithObject:QQ];
}

//汉字
+ (BOOL)validateChineseCharacters:(NSString *)Characters{
    NSString *CharactersRegex = @"^[\u4E00-\u9FA5]*$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CharactersRegex];
    return [passWordPredicate evaluateWithObject:Characters];
}

#pragma mark - add by lam
/// string 转 int
+ (NSInteger)trimIntValue:(NSString *)sender{
    if([sender isKindOfClass:[NSNull class]] || !sender){
        return -1;
        
    }else if([@"" isEqualToString:sender]){
        return 0;
        
    }else{
        return [sender integerValue];
    }
}

+ (NSString *)trimStringValue:(NSString *)sender{
    if([sender isKindOfClass:[NSNull class]] || !sender){
        return @"";
        
    }else{
        return sender;
    }
}

+ (CGFloat)getHeightFromString:(NSString *)content ExpectWidth:(CGFloat)width FontSize:(UIFont *)font{
    
    CGFloat height = 0;
    if (content.length == 0) {
        return height;
    }

    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:12];
    if ([content respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableDictionary *attr = [NSMutableDictionary new];
        attr[NSFontAttributeName] = font;

        CGRect rect = [content boundingRectWithSize:CGSizeMake(width, HUGE)
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attr context:nil];
        result = rect.size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [content sizeWithFont:font constrainedToSize:CGSizeMake(width, HUGE) lineBreakMode:NSLineBreakByTruncatingTail];
#pragma clang diagnostic pop
    }
    
    return result.height;
}

///归档
+ (void)keyedArchiverObject:(id)object ForKey:(NSString *)key ToFile:(NSString *)path
{
    NSMutableData *md=[NSMutableData data];
    NSKeyedArchiver *arch=[[NSKeyedArchiver alloc]initForWritingWithMutableData:md];
    [arch encodeObject:object forKey:key];
    [arch finishEncoding];
    [md writeToFile:path atomically:YES];
}

///反归档
+ (NSArray *)keyedUnArchiverForKey:(NSString *)key FromFile:(NSString *)path
{
    NSData *data=[NSData dataWithContentsOfFile:path];
    NSKeyedUnarchiver *unArch=[[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    NSArray *arr = [unArch decodeObjectForKey:key];
    return arr;
}

+(BOOL)isValidatePhoneNum1:(NSString *)phone{
    NSString *phoneRegex = @"^(1[0-9])\\d{9}$";//@"\\d{3}-\\d{8}|\\d{4}-\\d{7}|\\d{11}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:phone];
}










+ (NSString *)fileDocDir {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return docDir;
}

+ (NSString *)pathFileDocDir:(NSString *)path {
    NSString *docDir = [self fileDocDir];
    NSString *filePath = [docDir stringByAppendingPathComponent:path];
    return filePath;
}

+ (BOOL)fileExistAtPath:(NSString *)path {
    NSFileManager *filemanager = [NSFileManager defaultManager];
    return [filemanager fileExistsAtPath:path];
}

+ (BOOL)fileCreateDir:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    BOOL success = [fileManager createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:&error];
    if (!success) {

    }
    return success;
}

+ (BOOL)fileWriteAtPath:(NSString *)path data:(NSData *)data {
    return [data writeToFile:path atomically:NO];
}

+ (BOOL)fileDel:(NSString *)path {
    NSFileManager *filemanager = [NSFileManager defaultManager];
    NSError *error;
    BOOL success = [filemanager removeItemAtPath:path error:&error];
    if (!success)
    {

    }
    return success;
}


+(NSString *)saveHeaderCache:(UIImage *)headerImg{
    //保存目录
    NSString *fileSaveDir = [CommonUtils pathFileDocDir:@"HeaderCache"];
    // NSLog(@">>> %@",fileSaveDir);
    //判断目录是否存在
    if (![self fileExistAtPath:fileSaveDir])
    {
        [self fileCreateDir:fileSaveDir];
    }
    //照片转换为Data流
    NSData *picData = UIImagePNGRepresentation(headerImg);
    NSString *path = [fileSaveDir stringByAppendingPathComponent:[NSString stringWithFormat:@"header%.0f.png",[[NSDate date]timeIntervalSince1970]*1000]];
    if([self fileWriteAtPath:path data:picData]){
        return path;
    }else{
        return nil;
    }
}

//银行卡
+ (BOOL) checkCardNo:(NSString*) cardNo{
    if (cardNo.length<1) {
        return NO;
    }
    int oddsum = 0;     //奇数求和
    int evensum = 0;    //偶数求和
    int allsum = 0;
    int cardNoLength = (int)[cardNo length];
    int lastNum = [[cardNo substringFromIndex:cardNoLength-1] intValue];
    cardNo = [cardNo substringToIndex:cardNoLength - 1];
    for (int i = cardNoLength -1 ; i>=1;i--) {
        NSString *tmpString = [cardNo substringWithRange:NSMakeRange(i-1, 1)];
        int tmpVal = [tmpString intValue];
        if (cardNoLength % 2 ==1 ) {
            if((i % 2) == 0){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }else{
            if((i % 2) == 1){
                tmpVal *= 2;
                if(tmpVal>=10)
                    tmpVal -= 9;
                evensum += tmpVal;
            }else{
                oddsum += tmpVal;
            }
        }
    }
    
    allsum = oddsum + evensum;
    allsum += lastNum;
    if((allsum % 10) == 0)
        return YES;
    else
        return NO;
}

//如果字符串为nil，或者空串，或者全部为空格、tab、换行，返回YES，否则返回NO
+ (BOOL)isStrEmpty:(NSString*)string{
    if (string != nil &&  [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
                           length] > 0) {
        return NO;
    }
    
    return YES;
}


@end
