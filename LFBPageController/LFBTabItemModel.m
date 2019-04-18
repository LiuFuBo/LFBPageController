//
//  LFBTabItemModel.m
//  LFBPageController
//
//  Created by MAC on 2019/1/30.
//  Copyright © 2019年 liufubo. All rights reserved.
//

#import "LFBTabItemModel.h"
#import "LFBTabHeader.h"

@implementation LFBTabItemModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initConfig];
    }
    return self;
}

- (void)initConfig{
    self.normalColor = [UIColor colorWithHexString:@"#aaaaaa"];
    self.selectedColor = [UIColor colorWithHexString:@"#222222"];
}

@end
