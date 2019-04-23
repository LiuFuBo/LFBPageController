//
//  LFBTabItemModel.h
//  LFBPageController
//
//  Created by MAC on 2019/1/30.
//  Copyright © 2019年 liufubo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LFBTabItemModel : NSObject
//单个标题
@property (nonatomic, copy) NSString *tabWord;
//单个标题字号
@property (nonatomic, strong) UIFont *font;
//单个标题未选中时颜色
@property (nonatomic, strong) UIColor *normalColor;
//单个标题选中时颜色
@property (nonatomic, strong) UIColor *selectedColor;

@end
