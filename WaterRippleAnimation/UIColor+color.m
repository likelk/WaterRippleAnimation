//
//  UIColor+color.m
//  Orange
//
//  Created by 刘俊俊 on 16/10/20.
//  Copyright © 2016年 刘俊俊. All rights reserved.
//

#import "UIColor+color.h"

@implementation UIColor (color)

+ (UIColor *)colorWithColorString:(NSString *)color alpha:(CGFloat)alpha {
    
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}

+(UIColor *)colorHexToBinaryWithString:(NSString *)color {
    
    NSString *hex = [color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].uppercaseString;
    if ([hex hasPrefix:@"#"]) {
        hex = [hex substringFromIndex:1];
    }
    if (hex.length != 6) {
        return [UIColor blackColor];
    }
    NSString *redStr = [hex substringToIndex:2];
    NSString *greenStr = [[hex substringFromIndex:2]substringToIndex:2];
    NSString *blueStr = [[hex substringFromIndex:4]substringToIndex:2];
    
    unsigned int r = 0;
    unsigned int g = 0;
    unsigned int b = 0;
    
    [[NSScanner scannerWithString:redStr]scanHexInt:&r];
    [[NSScanner scannerWithString:greenStr]scanHexInt:&g];
    [[NSScanner scannerWithString:blueStr]scanHexInt:&b];
    
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
