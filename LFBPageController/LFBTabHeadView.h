//
//  LFBTabHeadView.h
//  LFBPageController
//
//  Created by MAC on 2019/1/30.
//  Copyright © 2019年 liufubo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LFBConfigItem.h"
#import "LFBTabItemModel.h"

@interface LFBTabHeadView : UIView
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) LFBConfigItem *configItem;
@property (nonatomic, copy) void(^tabHeadBlock)(NSInteger index,LFBTabItemModel *model);

/**
 初始化UI
 */
- (void)initUI;

/**
 *  更新tabItem选中位置
 */
- (void)updateViewLineWithOffset:(CGPoint)offset;
/**
 *  更新index下标对应标题
 */
- (void)updateTabTitle:(NSString *)title index:(NSInteger)index;


@end
