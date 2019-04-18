//
//  UIColor+Hex.h
//  LFBPageController
//
//  Created by MAC on 2019/1/30.
//  Copyright © 2019年 liufubo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)


+ (UIColor *)alphaColorWithHexString:(NSString *)alphaColor;

+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
// color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
