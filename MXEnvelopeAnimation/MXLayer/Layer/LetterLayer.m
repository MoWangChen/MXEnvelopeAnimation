//
//  OrderLayer.m
//  MXEnvelopeAnimation
//
//  Created by 谢鹏翔 on 2017/5/27.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "LetterLayer.h"
#import <UIKit/UIKit.h>
#import "LetterContentLayer.h"

#define kRetractDistance    20.f
#define KAnimationBeginTime (10.f/3.f)
#define KAnimationDuration (10.f/3.f)

@interface LetterLayer ()

@property (nonatomic, strong) UIBezierPath *originPath;
@property (nonatomic, strong) UIBezierPath *normalPath;
@property (nonatomic, strong) UIBezierPath *smallPath;
@property (nonatomic, strong) UIBezierPath *insidePath;

@property (nonatomic, strong) LetterContentLayer *contentLayer;

@end

@implementation LetterLayer

- (instancetype)initWithFrame:(CGRect)frame fillColor:(CGColorRef)color
{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, frame.size.height / 2, frame.size.width, frame.size.height / 2);
        self.path = self.normalPath.CGPath;
        self.fillColor = color;
        self.opacity = 0.4f;
        
    }
    return self;
}


- (void)upLetterAnimation_SectionOne
{
    [self addContentLayer];
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation1.fromValue = @0.4f;
    animation1.toValue = @0.9f;
    animation1.beginTime = KAnimationBeginTime;
    animation1.duration = KAnimationDuration;
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation2.fromValue = @(self.frame.size.height / 2.f * 3.f);
    animation2.toValue = @(0.f);
    animation2.beginTime = KAnimationBeginTime;
    animation2.duration = KAnimationDuration;
    
    
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc] init];
    animationGroup.animations = @[animation1,animation2];
    animationGroup.duration = KAnimationBeginTime + KAnimationDuration;
    animationGroup.repeatCount = 1;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    [self addAnimation:animationGroup forKey:nil];
}

- (void)upLetterAnimation_SectionTwo
{
    
}

- (void)upLetterAnimation_SectionThree
{
    
}

- (void)addContentLayer
{
    [self.contentLayer setNeedsDisplay];
    [self addSublayer:self.contentLayer];
}

//- (UIBezierPath *)originPath
//{
//    if (!_originPath) {
//        _originPath =
//    }
//}

- (UIBezierPath *)normalPath
{
    if (!_normalPath) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(kRetractDistance + 5.f, 0.f)];
        [path addLineToPoint:CGPointMake(self.frame.size.width - kRetractDistance - 5.f, 0.f)];
        [path addQuadCurveToPoint:CGPointMake(self.frame.size.width - kRetractDistance, 5.f)
                     controlPoint:CGPointMake(self.frame.size.width - kRetractDistance, 0.f)];
        [path addLineToPoint:CGPointMake(self.frame.size.width - kRetractDistance, self.frame.size.height - 5.f)];
        [path addQuadCurveToPoint:CGPointMake(self.frame.size.width - kRetractDistance - 5.f, self.frame.size.height)
                     controlPoint:CGPointMake(self.frame.size.width - kRetractDistance, self.frame.size.height)];
        [path addLineToPoint:CGPointMake(kRetractDistance + 5.f, self.frame.size.height)];
        [path addQuadCurveToPoint:CGPointMake(kRetractDistance, self.frame.size.height - 5.f)
                     controlPoint:CGPointMake(kRetractDistance, self.frame.size.height)];
        [path addLineToPoint:CGPointMake(kRetractDistance, 5.f)];
        [path addQuadCurveToPoint:CGPointMake(kRetractDistance + 5.f, 0.f)
                     controlPoint:CGPointMake(kRetractDistance, 0.f)];
        _normalPath = path;
    }
    return _normalPath;
}

- (LetterContentLayer *)contentLayer
{
    if (!_contentLayer) {
        _contentLayer = [[LetterContentLayer alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height * 2) fillColor:self.fillColor];
    }
    return _contentLayer;
}

@end
