//
//  HBT_UIShapedButton.m
//  HBT_UIShapedButtonDemo
//
//  Created by 李杰 on 15/12/12.
//  Copyright © 2015年 haobitou. All rights reserved.
//

#import "HBT_UIShapedButton.h"

@interface HBT_UIShapedButton ()

/**
 *  定义路径, 可以通过现有方法创建, 外部引用可以利用
 *  path 创建需要的形状
 */
@property(nonatomic, strong) UIBezierPath *shapePath;

@end

@implementation HBT_UIShapedButton
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _shapeType = HBT_UIShapedButtonTypeOutArrow;
    }
    return self;
}
-(void)setShapeType:(UIShapedButtonType)shapeType
{
    _shapeType = shapeType;
    [self setNeedsLayout];
}
/**
 *  绘制按钮时添加 path 遮罩
 *
 *  @param rect
 */
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    //update shapePath with rect
    self.shapePath = [self makePathWithType:self.shapeType inRect:rect];
    //
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = self.shapePath.CGPath;
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
    if (!self.shapePath) {
        return [super pointInside:point withEvent:event];
    }
    //
    if ([super pointInside:point withEvent:event] && [self.shapePath containsPoint:point]) {
        return YES;
    }
    return NO;
}
#define TITLE_LABEL_TAG 1234
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    // define the desired title inset margins based on the whole rect and its padding
    UIEdgeInsets padding = [self titleEdgeInsets];
    CGFloat offset = 0.f;
    if (self.shapeType == HBT_UIShapedButtonTypeInArrow) {
        offset = 10.f;
    }
    CGRect titleRect = CGRectMake(contentRect.origin.x    + padding.left + offset,
                                  contentRect.origin.x    + padding.top,
                                  contentRect.size.width  - (padding.right + padding.left),
                                  contentRect.size.height - (padding.bottom + padding.top));
    
    // save the current title view appearance
    NSString *title = [self currentTitle];
    UIColor  *titleColor = [self currentTitleColor];
    UIColor  *titleShadowColor = [self currentTitleShadowColor];
//    UIFont *titleFont = self.titleLabel.font;
    // we only want to add our custom label once; only 1st pass shall return nil
    UILabel  *titleLabel = (UILabel*)[self viewWithTag:TITLE_LABEL_TAG];
    
    
    if (!titleLabel)
    {
        // no custom label found (1st pass), we will be creating & adding it as subview
        titleLabel = [[UILabel alloc] initWithFrame:titleRect];
        [titleLabel setTag:TITLE_LABEL_TAG];
        
        // make it multi-line
        [titleLabel setNumberOfLines:0];
        [titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
        
        // title appearance setup; be at will to modify
        [titleLabel setBackgroundColor:[UIColor clearColor]];
//        titleLabel.font = titleFont;
        //[titleLabel setFont:[self font]];
        [titleLabel setShadowOffset:CGSizeMake(0, 1)];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        
        [self addSubview:titleLabel];
    }
    
    // finally, put our label in original title view's state
    [titleLabel setText:title];
    [titleLabel setTextColor:titleColor];
    [titleLabel setShadowColor:titleShadowColor];
    
    // and return empty rect so that the original title view is hidden
    return CGRectZero;
//    CGRect frame = [super titleRectForContentRect:contentRect];
//    if (self.shapeType == HBT_UIShapedButtonTypeInArrow) {
//        frame.origin.x = CGRectGetMinX(frame) + 10.f;
//    }
//
//    return frame;
}
#pragma mark - private method
-(UIBezierPath *)makePathWithType:(UIShapedButtonType)type inRect:(CGRect)rect
{
    UIBezierPath *path = nil;
    CGFloat buttonWidth = rect.size.width;
    CGFloat buttonHeight = rect.size.height;
    if (type == HBT_UIShapedButtonTypeOutArrow) {
        path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, 0)];
        CGFloat keyWidth = (sqrt(3) * buttonHeight) / 2.f - 10;
        [path addLineToPoint:CGPointMake(buttonWidth - keyWidth, 0)];
        [path addLineToPoint:CGPointMake(buttonWidth, buttonHeight / 2.f)];
        [path addLineToPoint:CGPointMake(buttonWidth - keyWidth, buttonHeight)];
        [path addLineToPoint:CGPointMake(0, buttonHeight)];
        [path closePath];
    } else {
        path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, 0)];
        CGFloat keyWidth = (sqrt(3) * buttonHeight) / 2 - 10;
        [path addLineToPoint:CGPointMake(buttonWidth, 0)];
        [path addLineToPoint:CGPointMake(buttonWidth, buttonHeight)];
        [path addLineToPoint:CGPointMake(0, buttonHeight)];
        [path addLineToPoint:CGPointMake(keyWidth, buttonHeight / 2)];
        [path closePath];
    }
    return path;
}

//- (void)hbt_createRightOutArrowOfButtonWithWidth:(CGFloat)width height:(CGFloat)height
//{
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(0, 0)];
//    CGFloat keyWidth = (sqrt(3) * height) / 2 - 10;
//    [path addLineToPoint:CGPointMake(width - keyWidth, 0)];
//    [path addLineToPoint:CGPointMake(width, height / 2)];
//    [path addLineToPoint:CGPointMake(width - keyWidth, height)];
//    [path addLineToPoint:CGPointMake(0, height)];
//    [path closePath];
//    self.path = path;
//}
//
//- (void)hbt_createLeftInArrowOfButtonWithWidth:(CGFloat)width height:(CGFloat)height
//{
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(0, 0)];
//    CGFloat keyWidth = (sqrt(3) * height) / 2 - 10;
//    [path addLineToPoint:CGPointMake(width, 0)];
//    [path addLineToPoint:CGPointMake(width, height)];
//    [path addLineToPoint:CGPointMake(0, height)];
//    [path addLineToPoint:CGPointMake(keyWidth, height / 2)];
//    [path closePath];
//    self.path = path;
//}

@end
