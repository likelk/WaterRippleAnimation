//
//  UIColor+color.h
//  Orange
//
//  Created by 刘俊俊 on 16/10/20.
//  Copyright © 2016年 刘俊俊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (color)

/**
 *  16进制颜色转化
 */
+ (UIColor *)colorWithColorString:(NSString *)color alpha:(CGFloat)alpha;

+(UIColor *)colorHexToBinaryWithString:(NSString *)color;

/**
 *  UIColor转成UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
