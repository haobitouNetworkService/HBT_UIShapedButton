//
//  ViewController.m
//  HBT_UIShapedButtonDemo
//
//  Created by 李杰 on 15/12/12.
//  Copyright © 2015年 haobitou. All rights reserved.
//

#import "ViewController.h"
#import "HBT_UIShapedButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // frame
    [self testWithFrame];
    
    // autolayout
    // 使用 autolayout 布局时调用 HBT_UIShapedButton 方法时注意
    // 确定对应 button 已经布局完成之后获取宽高传值
    // 可以调用 -layoutIfNeeded 强制提前布局
}

- (void)testWithFrame
{
    HBT_UIShapedButton *rightOutArrowButton = ({
        HBT_UIShapedButton *button = [[HBT_UIShapedButton alloc] initWithFrame:CGRectMake(20, 64, 150, 44)];
//        [button hbt_createRightOutArrowOfButtonWithWidth:100 height:40];
        button.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:button];
        [button setTitle:@"代办时间" forState:UIControlStateNormal];
        button;
    });
    
    HBT_UIShapedButton *leftInArrowButton = ({
        HBT_UIShapedButton *button = [[HBT_UIShapedButton alloc] initWithFrame:CGRectMake(190, 64, 150, 44)];
        button.shapeType = HBT_UIShapedButtonTypeInArrow;
//        [button hbt_createLeftInArrowOfButtonWithWidth:100 height:40];
        button.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:button];
        [button setTitle:@"2012-10-18\n12:24" forState:UIControlStateNormal];
        button;
    });
}

@end
