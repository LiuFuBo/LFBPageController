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
@property (nonatomic, copy) NSString *tabWord;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *normalColor;
@property (nonatomic, strong) UIColor *selectedColor;

@end
