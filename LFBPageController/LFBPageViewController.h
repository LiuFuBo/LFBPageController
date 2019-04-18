//
//  LFBPageViewController.h
//  LFBPageController
//
//  Created by MAC on 2019/1/30.
//  Copyright © 2019年 liufubo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFBTabHeadView.h"
#import "LFBConfigItem.h"


@interface LFBPageViewController : UIViewController
//tabHead
@property (nonatomic, strong) LFBTabHeadView *tabHeadView;
//初始化配置configItem
- (void)initConfigItem:(LFBConfigItem *)configItem;
//配置Vc容器信息
- (void)configItemModel;


@end
