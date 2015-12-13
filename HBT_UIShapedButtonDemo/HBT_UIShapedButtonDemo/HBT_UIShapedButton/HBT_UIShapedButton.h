//
//  HBT_UIShapedButton.h
//  HBT_UIShapedButtonDemo
//
//  Created by 李杰 on 15/12/12.
//  Copyright © 2015年 haobitou. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
HBT_UIShapedButton 使用贝塞尔路径绘制不规则的按钮,
并在绘制范围内相应事件
 */
@interface HBT_UIShapedButton : UIButton

/**
 *  定义路径, 可以通过现有方法创建, 外部引用可以利用
 *  path 创建需要的形状
 */
@property(nonatomic, strong) UIBezierPath *path;

/**
 *  创建右边突出箭头的按钮
 *
 *  @param width   按钮宽
 *  @param height  按钮高
 */
- (void)hbt_createRightOutArrowOfButtonWithWidth:(CGFloat)width height:(CGFloat)height;

/**
 *  创建左边凹陷箭头的按钮
 *
 *  @param width   按钮宽
 *  @param height  按钮高
 */
- (void)hbt_createLeftInArrowOfButtonWithWidth:(CGFloat)width height:(CGFloat)height;

@end
