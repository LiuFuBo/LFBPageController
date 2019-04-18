//
//  LFBTabHeadView.m
//  LFBPageController
//
//  Created by MAC on 2019/1/30.
//  Copyright © 2019年 liufubo. All rights reserved.
//

#import "LFBTabHeadView.h"
#import "LFBTabHeader.h"



@interface LFBTabHeadView  ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *tabScrollView;
@property (nonatomic, strong) NSMutableArray<UIButton *>*buttonsArray;
@property (nonatomic, strong) NSArray<LFBTabItemModel *> *tabArray;
@property (nonatomic, strong) UIView *viewLine;

@end

@implementation LFBTabHeadView

- (void)initUI{
    [self.tabScrollView setFrame:self.bounds];
    [self addSubview:self.tabScrollView];
    [self addSubview:self.viewLine];
    self.buttonsArray = @[].mutableCopy;
}

- (void)setConfigItem:(LFBConfigItem *)configItem{
    _configItem = configItem;
    [self setTabArray:configItem.tabArray];
}

- (void)setTabArray:(NSArray<LFBTabItemModel *> *)tabArray{
    
    _tabArray = tabArray;
    [self.tabScrollView removeAllSubviews];
    if (tabArray.count <= 1) {
        return;
    }
    CGFloat itemWidth = kMainScreenWidth/tabArray.count;
    CGFloat itemHeight = 40.0f;
    for (int index =0; index<tabArray.count; index++) {
        LFBTabItemModel *model = tabArray[index];
        UIButton *item = [[UIButton alloc]init];
        item.frame = CGRectMake(index*itemWidth, 0, itemWidth, itemHeight);
        [item setTitle:model.tabWord forState:UIControlStateNormal];
        if (model.font) {
         [item.titleLabel setFont:model.font];
        }else{
         [item.titleLabel setFont:self.configItem.font];
        }
        [item addTarget:self action:@selector(p_clickItem:) forControlEvents:UIControlEventTouchUpInside];
        if (index == 0) {
           [item setTitleColor:model.normalColor forState:UIControlStateNormal];
        }else{
           [item setTitleColor:model.selectedColor forState:UIControlStateNormal];
        }
        item.tag = index + 100;
        if (self.configItem.showVerticalLine) {
            [self setVerticalLineWithIndex:index item:item];
        }
        [self.buttonsArray addObject:item];
        [self.tabScrollView addSubview:item];
    }
    [self setSepViewLine];//底部分割线
    [self setViewLine];//设置下标线
    self.tabScrollView.contentSize = CGSizeMake(kMainScreenWidth, 0);
    self.currentIndex = 0;
}

- (void)setVerticalLineWithIndex:(NSInteger)currentIndex item:(UIButton *)item{
    if (currentIndex == 0) {
        return;
    }
    UIView *verticalLine = [[UIView alloc]init];
    verticalLine.bounds = CGRectMake(0, 0, self.configItem.verticalLineWidth, self.configItem.verticalLineHeight);
    verticalLine.backgroundColor = self.configItem.verticalLineColor;
    verticalLine.center = CGPointMake(item.left - self.configItem.verticalLineWidth/2, item.centerY);
    [self.tabScrollView addSubview:verticalLine];
}

- (void)setViewLine{
    [self.tabScrollView addSubview:self.viewLine];
    [self.viewLine setFrame:CGRectMake(0, self.frame.size.height - 3, self.configItem.viewLineWidth, 2)];
}

- (void)setSepViewLine{
    UIView *sepViewLine  = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height - kSplitLineHeightFix(1.2), kMainScreenWidth, kSplitLineHeightFix(1.2))];
    sepViewLine.backgroundColor = [UIColor colorWithHexString:@"#E5E5E5"];
    [self.tabScrollView addSubview:sepViewLine];
}

- (void)p_clickItem:(UIButton *)sender{
    int index = (int)(sender.tag - 100);
    LFBTabItemModel *model = self.tabArray[index];
    [self setCurrentIndex:index];
    if (self.tabHeadBlock) {
        self.tabHeadBlock(index, model);
    }
}

- (void)setCurrentIndex:(NSInteger)currentIndex{
    if (currentIndex>= 0 && currentIndex < self.tabArray.count) {
        _currentIndex = currentIndex;
        [self.buttonsArray enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            LFBTabItemModel *model = [self.tabArray safeObjectAtIndex:idx];
            obj.selected = NO;
            [obj setTitleColor:model.normalColor forState:UIControlStateNormal];
        }];
        LFBTabItemModel *selectedModel = [self.tabArray safeObjectAtIndex:currentIndex];
        UIButton *item = self.buttonsArray[currentIndex];
        [item setTitleColor:selectedModel.selectedColor forState:UIControlStateNormal];
        item.selected = YES;
    }
    [self updateViewLine];
}

- (void)updateTabTitle:(NSString *)title index:(NSInteger)index{
    if (index < 0 || index> self.buttonsArray.count) {
        return;
    }
    UIButton *item = [self.buttonsArray safeObjectAtIndex:index];
    [item setTitle:title forState:UIControlStateNormal];
}

- (void)updateViewLine{
    UIButton *item = [self.buttonsArray objectAtIndex:self.currentIndex];
    [UIView animateWithDuration:0.3 animations:^{
        self.viewLine.center = CGPointMake(item.center.x, self.bounds.size.height - 2);
    }];
}

- (void)updateViewLineWithOffset:(CGPoint)offset
{
    CGFloat offsetx = offset.x;
    if (offsetx < 0 || offsetx >= (self.buttonsArray.count -1)*kMainScreenWidth) {
        return;
    }
    NSInteger curIndex = offsetx / kMainScreenWidth;
    CGFloat itemOffsetX = fmodf(offsetx, kMainScreenWidth);
    NSInteger unitWidth = kMainScreenWidth*0.5;
    UIButton *curItem = [self.buttonsArray objectAtIndex:curIndex];
    UIButton *nextItem = [self.buttonsArray objectAtIndex:curIndex+1];
    [self.buttonsArray enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LFBTabItemModel *model = [self.tabArray safeObjectAtIndex:idx];
        obj.selected = NO;
        [obj setTitleColor:model.normalColor forState:UIControlStateNormal];
    }];
    [UIView animateWithDuration:0.3 animations:^{
        if (itemOffsetX < unitWidth) {
            [curItem setSelected:YES];
             LFBTabItemModel *model = [self.tabArray safeObjectAtIndex:curIndex];
            [curItem setTitleColor:model.selectedColor forState:UIControlStateNormal];
             self.viewLine.center = CGPointMake(curItem.center.x, self.bounds.size.height - 2);
        }else{
            [nextItem setSelected:YES];
            LFBTabItemModel *model = [self.tabArray safeObjectAtIndex:curIndex+1];
            [nextItem setTitleColor:model.selectedColor forState:UIControlStateNormal];
            self.viewLine.center = CGPointMake(nextItem.center.x, self.bounds.size.height - 2);
        }
    }];
}

#pragma mark - getter & setter
- (UIScrollView *)tabScrollView{
    return _tabScrollView?:({
        _tabScrollView = [[UIScrollView alloc]init];
        _tabScrollView.delegate = self;
        _tabScrollView.showsVerticalScrollIndicator = NO;
        _tabScrollView.showsHorizontalScrollIndicator = NO;
        _tabScrollView;
    });
}

- (UIView *)viewLine{
    return _viewLine?:({
        _viewLine = [[UIView alloc]init];
        _viewLine.backgroundColor = [UIColor colorWithHexString:@"#ff862f"];
        _viewLine;
    });
}


@end
