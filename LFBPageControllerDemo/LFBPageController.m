//
//  LFBPageController.m
//  LFBPageControllerDemo
//
//  Created by liufubo on 2019/4/18.
//  Copyright © 2019 liufubo. All rights reserved.
//

#import "LFBPageController.h"
#import "LFBBuyViewController.h"
#import "LFBShopViewController.h"
#import "LFBPayViewController.h"
#import "LFBShareViewController.h"
#import "LFBTabHeader.h"

@interface LFBPageController ()

@end

@implementation LFBPageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"导航栏滚动";
}

- (void)configItemModel{
    
    LFBConfigItem *configItem = [[LFBConfigItem alloc]init];
    [configItem setShowVerticalLine:YES];
    LFBTabItemModel *buyTabItem = [[LFBTabItemModel alloc]init];
    buyTabItem.tabWord = @"购物";
    LFBTabItemModel *shopTabItem = [[LFBTabItemModel alloc]init];
    shopTabItem.tabWord = @"店铺";
    LFBTabItemModel *payTabItem = [[LFBTabItemModel alloc]init];
    payTabItem.tabWord = @"支付";
    LFBTabItemModel *shrareTabItem = [[LFBTabItemModel alloc]init];
    shrareTabItem.tabWord = @"分享";
    configItem.tabArray = @[buyTabItem,shopTabItem,payTabItem,shrareTabItem];
    LFBBuyViewController *buyVc = [[LFBBuyViewController alloc]init];
    LFBShopViewController *shopVc = [[LFBShopViewController alloc]init];
    LFBPayViewController *payVc = [[LFBPayViewController alloc]init];
    LFBShareViewController *shareVc = [[LFBShareViewController alloc]init];
    configItem.controllers = @[buyVc,shopVc,payVc,shareVc];
    [self initConfigItem:configItem];
}

@end
