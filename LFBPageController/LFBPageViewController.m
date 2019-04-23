//
//  LFBPageViewController.m
//  LFBPageController
//
//  Created by MAC on 2019/1/30.
//  Copyright © 2019年 liufubo. All rights reserved.
//

#import "LFBPageViewController.h"
#import "LFBConfigItem.h"
#import "LFBTabHeadView.h"
#import "LFBTabHeader.h"


@interface LFBPageViewController ()<UIScrollViewDelegate>
//滚动scrollView
@property (nonatomic, strong) UIScrollView *scrollView;
//configItem
@property (nonatomic, strong) LFBConfigItem *configItem;
@end

@implementation LFBPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initParameter];
    [self configItemModel];
    [self createHeadView];
    [self setupContentView];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)initUIFrame{
    CGFloat tabHeadHeight = (self.configItem.headViewHeight > 0) ? self.configItem.headViewHeight : 44;
    [self.tabHeadView setFrame:CGRectMake(0, 0, kMainScreenWidth, tabHeadHeight)];
    [self.scrollView setFrame:CGRectMake(0,self.tabHeadView.bounds.size.height, kMainScreenWidth, kMainScreenHeight - self.tabHeadView.bottom - kNavAndStatusBarHeight)];
    [self.tabHeadView initUI];
}

- (void)initConfigItem:(LFBConfigItem *)configItem{
    if (configItem.headViewHeight >= 40) {
        self.configItem.headViewHeight = configItem.headViewHeight;
    }
    [self initUIFrame];
    if (configItem.showVerticalLine) {
        self.configItem.showVerticalLine = configItem.showVerticalLine;
    }
    if (configItem.font) {
        self.configItem.font = configItem.font;
    }
    if (configItem.normalColor) {
        self.configItem.normalColor = configItem.normalColor;
    }
    if (configItem.selectedColor) {
        self.configItem.selectedColor = configItem.selectedColor;
    }
    if (configItem.verticalLineColor) {
        self.configItem.verticalLineColor = configItem.verticalLineColor;
    }
    if (configItem.viewLineWidth > 0) {
        self.configItem.viewLineWidth = configItem.viewLineWidth;
    }
    if (configItem.verticalLineWidth > 0) {
        self.configItem.verticalLineWidth = configItem.verticalLineWidth;
    }
    if (configItem.verticalLineHeight > 0) {
        self.configItem.verticalLineHeight = configItem.verticalLineHeight;
    }
    self.configItem.tabArray = configItem.tabArray;
    self.configItem.controllers = configItem.controllers;
    self.tabHeadView.configItem = self.configItem;
}

- (void)initParameter{
    self.configItem.showVerticalLine = NO;
    self.configItem.headViewHeight = 44.0f;
    self.configItem.viewLineWidth = 20.0f;
    self.configItem.verticalLineWidth = 1.0f;
    self.configItem.verticalLineHeight = 10.0f;
    self.configItem.font = [UIFont systemFontOfSize:15];
    self.configItem.normalColor = [UIColor colorWithHexString:@"#aaaaaa"];
    self.configItem.selectedColor = [UIColor colorWithHexString:@"#222222"];
    self.configItem.verticalLineColor = [UIColor colorWithHexString:@"#dcdcdc"];
}

- (void)configItemModel{

}

- (void)createHeadView{
    [self.view addSubview:self.tabHeadView];
}

- (void)setupContentView{
    [self.view addSubview:self.scrollView];
    [self.configItem.tabArray enumerateObjectsUsingBlock:^(LFBTabItemModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
           [self setupViewController:idx model:obj];
        }
        *stop = YES;
    }];
    self.scrollView.contentSize = CGSizeMake(kMainScreenWidth *self.configItem.tabArray.count, 0);
}

- (void)setupViewController:(NSInteger)index model:(LFBTabItemModel *)model{
    UIViewController *viewController = [self.configItem.controllers objectAtIndex:index];
    if (![self.childViewControllers containsObject:viewController]) {
        viewController.view.frame =  self.scrollView.bounds;
        viewController.view.left = index*kMainScreenWidth;
        [self.scrollView addSubview:viewController.view];
        [self addChildViewController:viewController];
    }
}

- (void)updateContentViewOffset{
    NSInteger currentIndex = self.tabHeadView.currentIndex;
    [UIView animateWithDuration:0.3 animations:^{
        [self.scrollView setContentOffset:CGPointMake(kMainScreenWidth*currentIndex, 0)];
    }];
    LFBTabItemModel *item = [self.configItem.tabArray safeObjectAtIndex:currentIndex];
    [self setupViewController:currentIndex model:item];
}

- (void)updateViewControllerOffset:(CGPoint )offset{
    CGFloat offsetx = offset.x;
    if (offsetx < 0 || offsetx >= (self.configItem.tabArray.count -1)*kMainScreenWidth) {
        return;
    }
    NSInteger curIndex = offsetx / kMainScreenWidth;
    CGFloat itemOffsetX = fmodf(offsetx, kMainScreenWidth);
    NSInteger unitWidth = kMainScreenWidth*0.5;
    LFBTabItemModel *curItem = [self.configItem.tabArray safeObjectAtIndex:curIndex];
    LFBTabItemModel *nextItem =[self.configItem.tabArray safeObjectAtIndex:curIndex + 1];
    if (itemOffsetX < unitWidth) {
       [self setupViewController:curIndex model:curItem];
    }else{
       [self setupViewController:curIndex +1 model:nextItem];
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.scrollView) {
        [self updateViewControllerOffset:scrollView.contentOffset];
        [self.tabHeadView updateViewLineWithOffset:scrollView.contentOffset];
    }
}
#pragma mark - getter & setter
- (UIScrollView *)scrollView{
    return _scrollView?:({
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = YES;
        _scrollView.delegate = self;
        [_scrollView setBackgroundColor:[UIColor colorWithHexString:@"#f5f5f5"]];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView;
    });
}

- (LFBTabHeadView *)tabHeadView{
    return _tabHeadView?:({
        _tabHeadView = [[LFBTabHeadView alloc]init];
        sss(self);
        [_tabHeadView setTabHeadBlock:^(NSInteger index, LFBTabItemModel *model) {
            ggg(self);
            [self updateContentViewOffset];
        }];
        _tabHeadView;
    });
}

- (LFBConfigItem *)configItem{
    return _configItem?:({
        _configItem = [[LFBConfigItem alloc]init];
        _configItem;
    });
}

@end
