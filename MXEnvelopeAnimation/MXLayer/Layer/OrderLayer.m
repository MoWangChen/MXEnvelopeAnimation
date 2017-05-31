//
//  OrderLayer.m
//  MXEnvelopeAnimation
//
//  Created by 谢鹏翔 on 2017/5/27.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "OrderLayer.h"
#import <UIKit/UIKit.h>

#define kRetractDistance    20.f

@interface OrderLayer ()

@property (nonatomic, strong) UIBezierPath *normalPath;
@property (nonatomic, strong) UIBezierPath *smallPath;
@property (nonatomic, strong) UIBezierPath *insidePath;

@end

@implementation OrderLayer

- (instancetype)initWithFrame:(CGRect)frame fillColor:(CGColorRef)color
{
    self = [super init];
    if (self) {
        self.frame = frame;
        self.fillColor = color;
        self.path = self.normalPath.CGPath;
    }
    return self;
}

- (UIBezierPath *)normalPath
{
    if (!_normalPath) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(kRetractDistance + 5.f, 0.f)];
        [path addLineToPoint:CGPointMake(self.frame.size.width - kRetractDistance - 5.f, 0.f)];
        [path addQuadCurveToPoint:CGPointMake(self.frame.size.width - kRetractDistance, 5.f) controlPoint:CGPointMake(self.frame.size.width - kRetractDistance, 0.f)];
        [path addLineToPoint:CGPointMake(self.frame.size.width - kRetractDistance, self.frame.size.height - 5.f)];
        [path addQuadCurveToPoint:CGPointMake(self.frame.size.width - kRetractDistance - 5.f, self.frame.size.height) controlPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
        [path addLineToPoint:CGPointMake(kRetractDistance + 5.f, self.frame.size.height)];
        [path addQuadCurveToPoint:CGPointMake(kRetractDistance, self.frame.size.height - 5.f) controlPoint:CGPointMake(kRetractDistance, self.frame.size.height)];
        [path addLineToPoint:CGPointMake(kRetractDistance, 5.f)];
        [path addQuadCurveToPoint:CGPointMake(kRetractDistance + 5.f, 0.f) controlPoint:CGPointMake(0.f, 0.f)];
        _normalPath = path;
    }
    return _normalPath;
}

@end
