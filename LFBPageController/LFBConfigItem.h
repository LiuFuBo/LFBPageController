//
//  LFBConfigItem.h
//  LFBPageController
//
//  Created by MAC on 2019/1/30.
//  Copyright © 2019年 liufubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFBTabItemModel.h"

@interface LFBConfigItem : NSObject
//头部Item
@property (nonatomic, strong) NSArray<LFBTabItemModel *> *tabArray;
//控制器
@property (nonatomic, strong) NSArray<UIViewController *> *controllers;
//是否展示各个按钮分割线
@property (nonatomic, assign) BOOL showVerticalLine;
//当showVerticalLine为YES时，可设置按钮分割线宽度
@property (nonatomic, assign) CGFloat verticalLineWidth;
//当showVerticalLine为YES时，可设置按钮分割线高度
@property (nonatomic, assign) CGFloat verticalLineHeight;
//各个按钮竖向分割线颜色设置
@property (nonatomic, strong) UIColor *verticalLineColor;
//滑动短线宽度
@property (nonatomic, assign) CGFloat viewLineWidth;
//配置头部标题字体大小
@property (nonatomic, strong) UIFont *font;


@end
