//
//  LFBTabHeader.h
//  LFBPageController
//
//  Created by MAC on 2019/1/30.
//  Copyright © 2019年 liufubo. All rights reserved.
//

#ifndef LFBTabHeader_h
#define LFBTabHeader_h
#import "UIColor+Hex.h"
#import "UIView+Utils.h"
#import "NSObject+Additionals.h"


#define kMainScreenWidth         ([UIScreen mainScreen].bounds).size.width
#define kMainScreenHeight        ([UIScreen mainScreen].bounds).size.height
#define kSplitLineHeightFix(a)    ((a) / ([UIScreen mainScreen].scale))

#define K_IS_PhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define kStatusBarHeight ( K_IS_PhoneX ? (44) : (20))
#define kTopSafeHeight ( K_IS_PhoneX ? (24) : (0))
#define kNavAndStatusBarHeight ( K_IS_PhoneX ? (88) : (64))
#define kTabBarHeight ( K_IS_PhoneX ? (83) : (49))
#define kBottomSafeHeight ( K_IS_PhoneX ? (34) : (0))

#define sss(type)__weak typeof(type)weak##type = type;
#define ggg(type)__strong typeof(type)type = weak##type;

#endif /* LFBTabHeader_h */
