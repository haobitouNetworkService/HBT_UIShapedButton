//
//  HBT_UIShapedButton.m
//  HBT_UIShapedButtonDemo
//
//  Created by 李杰 on 15/12/12.
//  Copyright © 2015年 haobitou. All rights reserved.
//

#import "HBT_UIShapedButton.h"

@implementation HBT_UIShapedButton

/**
 *  绘制按钮时添加 path 遮罩
 *
 *  @param rect
 */
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = self.path.CGPath;
    self.layer.mask = layer;
}

/**
 *  判断手指点击的落点是否在 path 范围内
 *
 *  @param point 落点
 *  @param event
 *
 *  @return YES 响应事件; NO 不响应事件
 */
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL res = [super pointInside:point withEvent:event];
    if (res) {
        if ([self.path containsPoint:point]) {
            return YES;
        }
        return NO;
    }
    return NO;
}

- (void)hbt_createRightOutArrowOfButtonWithWidth:(CGFloat)width height:(CGFloat)height
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    CGFloat keyWidth = (sqrt(3) * height) / 2 - 10;
    [path addLineToPoint:CGPointMake(width - keyWidth, 0)];
    [path addLineToPoint:CGPointMake(width, height / 2)];
    [path addLineToPoint:CGPointMake(width - keyWidth, height)];
    [path addLineToPoint:CGPointMake(0, height)];
    [path closePath];
    self.path = path;
}

- (void)hbt_createLeftInArrowOfButtonWithWidth:(CGFloat)width height:(CGFloat)height
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 0)];
    CGFloat keyWidth = (sqrt(3) * height) / 2 - 10;
    [path addLineToPoint:CGPointMake(width, 0)];
    [path addLineToPoint:CGPointMake(width, height)];
    [path addLineToPoint:CGPointMake(0, height)];
    [path addLineToPoint:CGPointMake(keyWidth, height / 2)];
    [path closePath];
    self.path = path;
}

@end
