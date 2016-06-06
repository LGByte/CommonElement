//
//  NSNumber+BinAdd.h
//  CommonElement
//
//  Created by 熊彬 on 16/6/3.
//  Copyright © 2016年 熊彬. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (BinAdd)
#pragma mark - NumberWithString
///=============================================================================
/// @name numberWithString
///=============================================================================

/**
 @param string  The string described an number.
 
 @return an NSNumber when parse succeed, or nil if an error occurs.
 */
+ (nullable NSNumber *)numberWithString:(NSString *)string;

#pragma mark - RoundPlain
///=============================================================================
/// @name RoundPlain
///=============================================================================
/**
 *  @brief  四舍五入 NSRoundPlain
 *
 *  @param scale 限制位数
 *
 *  @return 返回结果
 */
- (NSDecimalNumber*)roundToScale:(NSUInteger)scale;
/**
 *  @brief  四舍五入
 *
 *  @param scale        限制位数
 *  @param roundingMode NSRoundingMode
 *
 *  @return 返回结果
 */
- (NSDecimalNumber*)roundToScale:(NSUInteger)scale mode:(NSRoundingMode)roundingMode;
@end

NS_ASSUME_NONNULL_END