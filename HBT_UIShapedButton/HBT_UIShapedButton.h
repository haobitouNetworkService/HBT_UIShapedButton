//
//  HBT_UIShapedButton.h
//  HBT_UIShapedButtonDemo
//
//  Created by 李杰 on 15/12/12.
//  Copyright © 2015年 haobitou. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    HBT_UIShapedButtonTypeOutArrow = 0,
    HBT_UIShapedButtonTypeInArrow,
} UIShapedButtonType;

/**
HBT_UIShapedButton 使用贝塞尔路径绘制不规则的按钮,
并在绘制范围内相应事件
 */
@interface HBT_UIShapedButton : UIButton

/**
 *  按钮类型  默认HBT_UIShapedButtonTypeOutArrow  
 */
@property (nonatomic) UIShapedButtonType shapeType;


@end
