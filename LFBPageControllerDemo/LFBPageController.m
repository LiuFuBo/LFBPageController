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
    configItem.showVerticalLine = YES;
    LFBTabItemModel *buyTabItem = [[LFBTabItemModel alloc]init];
    buyTabItem.tabWord = @"购物";
    buyTabItem.font = [UIFont boldSystemFontOfSize:15];
    buyTabItem.normalColor = [UIColor colorWithHexString:@"#aaaaaa"];
    buyTabItem.selectedColor = [UIColor colorWithHexString:@"#222222"];
    LFBTabItemModel *shopTabItem = [[LFBTabItemModel alloc]init];
    shopTabItem.tabWord = @"店铺";
    shopTabItem.font = [UIFont boldSystemFontOfSize:15];
    shopTabItem.normalColor = [UIColor colorWithHexString:@"#aaaaaa"];
    shopTabItem.selectedColor = [UIColor colorWithHexString:@"#222222"];
    LFBTabItemModel *payTabItem = [[LFBTabItemModel alloc]init];
    payTabItem.tabWord = @"支付";
    payTabItem.font = [UIFont boldSystemFontOfSize:15];
    payTabItem.normalColor = [UIColor colorWithHexString:@"#aaaaaa"];
    payTabItem.selectedColor = [UIColor colorWithHexString:@"#222222"];
    LFBTabItemModel *shrareTabItem = [[LFBTabItemModel alloc]init];
    shrareTabItem.tabWord = @"分享";
    shrareTabItem.font = [UIFont boldSystemFontOfSize:15];
    shrareTabItem.normalColor = [UIColor colorWithHexString:@"#aaaaaa"];
    shrareTabItem.selectedColor = [UIColor colorWithHexString:@"#222222"];
    configItem.tabArray = @[buyTabItem,shopTabItem,payTabItem,shrareTabItem];
    LFBBuyViewController *buyVc = [[LFBBuyViewController alloc]init];
    LFBShopViewController *shopVc = [[LFBShopViewController alloc]init];
    LFBPayViewController *payVc = [[LFBPayViewController alloc]init];
    LFBShareViewController *shareVc = [[LFBShareViewController alloc]init];
    configItem.controllers = @[buyVc,shopVc,payVc,shareVc];
    [self initConfigItem:configItem];
}

@end
