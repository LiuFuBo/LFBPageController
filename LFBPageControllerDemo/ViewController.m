//
//  ViewController.m
//  LFBPageControllerDemo
//
//  Created by liufubo on 2019/4/18.
//  Copyright © 2019 liufubo. All rights reserved.
//

#import "ViewController.h"
#import "LFBPageController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"开始演示";
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(40, 200, self.view.bounds.size.width - 80 , 100)];
    [button setTitle:@"开始演示" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)clickButton:(UIButton *)sender{
    LFBPageController *pageVc = [[LFBPageController alloc]init];
    [self.navigationController pushViewController:pageVc animated:YES];
}


@end
