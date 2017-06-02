//
//  SealLayer.m
//  MXEnvelopeAnimation
//
//  Created by 谢鹏翔 on 2017/5/26.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "SealLayer.h"
#import <UIKit/UIKit.h>

#define KAnimationBeginTime (10.f/3.f)
#define KAnimationDuration (10.f/3.f)

@interface SealLayer ()

@property (nonatomic, strong) UIBezierPath *invertedTrianglePath;
@property (nonatomic, strong) UIBezierPath *lineTrianglePath;
@property (nonatomic, strong) UIBezierPath *forwardTrianglePath;


@end

@implementation SealLayer

- (instancetype)initWithFrame:(CGRect)frame fillColor:(CGColorRef)color
{
    self = [super init];
    if (self) {
        self.frame = frame;
        self.fillColor = [UIColor redColor].CGColor;
        self.path = self.invertedTrianglePath.CGPath;
    }
    return self;
}

- (void)openEnvelopeAnimation
{
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation1.fromValue = (__bridge id _Nullable)(self.invertedTrianglePath.CGPath);
    animation1.toValue = (__bridge id _Nullable)(self.lineTrianglePath.CGPath);
    animation1.beginTime = KAnimationBeginTime;
    animation1.duration = KAnimationDuration;
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"path"];
    animation2.fromValue = (__bridge id _Nullable)(self.lineTrianglePath.CGPath);
    animation2.toValue = (__bridge id _Nullable)(self.forwardTrianglePath.CGPath);
    animation2.beginTime = animation1.beginTime + animation1.duration;
    animation2.duration = KAnimationDuration;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(animation2.beginTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.fillColor = [UIColor colorWithWhite:1.0 alpha:0.6].CGColor;
    });
    
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc] init];
    animationGroup.animations = @[animation1,animation2];
    animationGroup.duration = KAnimationBeginTime + 2 * KAnimationDuration;
    animationGroup.repeatCount = 1;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    [self addAnimation:animationGroup forKey:nil];
}

- (UIBezierPath *)invertedTrianglePath
{
    if (!_invertedTrianglePath) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0.f, 0.f)];
        [path addLineToPoint:CGPointMake(self.frame.size.width, 0.f)];
        [path addLineToPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
        [path addLineToPoint:CGPointMake(0.f, 0.f)];
        _invertedTrianglePath = path;
    }
    return _invertedTrianglePath;
}

- (UIBezierPath *)lineTrianglePath
{
    if (!_lineTrianglePath) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0.f, 0.f)];
        [path addLineToPoint:CGPointMake(self.frame.size.width, 0.f)];
        [path addLineToPoint:CGPointMake(self.frame.size.width / 2, 1.f)];
        [path addLineToPoint:CGPointMake(0.f, 0.f)];
        _lineTrianglePath = path;
    }
    return _lineTrianglePath;
}

- (UIBezierPath *)forwardTrianglePath
{
    if (!_forwardTrianglePath) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0.f, -0.5f)];
        [path addLineToPoint:CGPointMake(self.frame.size.width, -0.5f)];
        [path addLineToPoint:CGPointMake(self.frame.size.width / 2, -self.frame.size.height / 2)];
        [path addLineToPoint:CGPointMake(0.f, -0.5f)];
        _forwardTrianglePath = path;
    }
    return _forwardTrianglePath;
}

@end
