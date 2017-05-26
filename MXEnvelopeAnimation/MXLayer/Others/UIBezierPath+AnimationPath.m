//
//  UIBezierPath+AnimationPath.m
//  MXEnvelopeAnimation
//
//  Created by 谢鹏翔 on 2017/5/26.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "UIBezierPath+AnimationPath.h"

@implementation UIBezierPath (AnimationPath)

+ (UIBezierPath *)envelopeAnimationPath:(CALayer *)point distance:(CGFloat)distance
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:point.position];
    [path addLineToPoint:CGPointMake(point.position.x, point.position.y + distance)];
    [path addLineToPoint:CGPointMake(point.position.x, point.position.y + distance * 0.7)];
    return path;
}

@end
