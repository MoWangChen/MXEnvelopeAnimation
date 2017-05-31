//
//  EnvolopeLayer.m
//  MXEnvelopeAnimation
//
//  Created by 谢鹏翔 on 2017/5/25.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "EnvelopeLayer.h"
#import <UIKit/UIKit.h>
#import "UIBezierPath+AnimationPath.h"
#import "SealLayer.h"
#import "LetterLayer.h"

@interface EnvelopeLayer ()

@property (nonatomic, strong) CAShapeLayer *shadowLayer;
@property (nonatomic, strong) CAShapeLayer *fixedLayer;
@property (nonatomic, strong) SealLayer *sealLayer;
@property (nonatomic, strong) CAShapeLayer *coverLayer;
@property (nonatomic, strong) CAShapeLayer *decorateLayer;
@property (nonatomic, strong) CAShapeLayer *outlineLayer;

@property (nonatomic, strong) LetterLayer *letterLayer;

@end

@implementation EnvelopeLayer

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        self.frame = frame;
        self.fillColor = [UIColor whiteColor].CGColor;
        [self addSublayer:self.shadowLayer];
        [self addSublayer:self.sealLayer];
        [self addSublayer:self.outlineLayer];
        [self addSublayer:self.decorateLayer];
        [self addSublayer:self.coverLayer];
    }
    return self;
}

- (void)moveDownAnimation
{
    [self moveLetterUpAnimation];
    
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.path = [UIBezierPath envelopeAnimationPath:self distance:100.f].CGPath;
    keyAnimation.fillMode = kCAFillModeForwards;
    keyAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    keyAnimation.duration = 10;
    keyAnimation.removedOnCompletion = NO;
    [self addAnimation:keyAnimation forKey:@"moveAnimation"];
    [self.sealLayer openEnvelopeAnimation];
}

- (void)moveLetterUpAnimation
{
    [self.letterLayer setNeedsDisplay];
    [self insertSublayer:self.letterLayer below:self.outlineLayer];
    [self.letterLayer upLetterAnimation_SectionOne];
}

- (CAShapeLayer *)shadowLayer
{
    if (!_shadowLayer) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0.f, -1.f)];
        [path addLineToPoint:CGPointMake(self.frame.size.width, 0.f)];
        [path addLineToPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
        [path addLineToPoint:CGPointMake(0.f, 0.f)];
        _shadowLayer = [[CAShapeLayer alloc] init];
        _shadowLayer.fillColor = [UIColor colorWithWhite:1.0 alpha:0.6].CGColor;
        _shadowLayer.path = path.CGPath;
    }
    return _shadowLayer;
}

- (SealLayer *)sealLayer
{
    if (!_sealLayer) {
        _sealLayer = [[SealLayer alloc] initWithFrame:self.frame fillColor:self.fillColor];
    }
    return _sealLayer;
}

- (CAShapeLayer *)outlineLayer
{
    if (!_outlineLayer) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, 0)];
        [path addLineToPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
        [path addLineToPoint:CGPointMake(self.frame.size.width, 0)];
        [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
        [path addLineToPoint:CGPointMake(0, self.frame.size.height)];
        [path addLineToPoint:CGPointMake(0, 0)];
        
        _outlineLayer = [[CAShapeLayer alloc] init];
        _outlineLayer.fillColor = self.fillColor;
        _outlineLayer.path = path.CGPath;
    }
    return _outlineLayer;
}

- (CAShapeLayer *)decorateLayer
{
    if (!_decorateLayer) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        
        [path moveToPoint:CGPointMake(0.f, 0.f)];
        [path addLineToPoint:CGPointMake(self.frame.size.width * 25 / 69, self.frame.size.height * 25 / 69)];
        [path addLineToPoint:CGPointMake(0.f, self.frame.size.height)];
        [path addLineToPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height * 28 / 69)];
        [path addLineToPoint:CGPointMake(0.f, 0.f)];
        
        [path moveToPoint:CGPointMake(self.frame.size.width, 0.f)];
        [path addLineToPoint:CGPointMake(self.frame.size.width * 44 / 69, self.frame.size.height * 25 / 69)];
        [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
        [path addLineToPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height * 28 / 69)];
        [path addLineToPoint:CGPointMake(self.frame.size.width, 0.f)];
        
        _decorateLayer = [CAShapeLayer layer];
        _decorateLayer.path = path.CGPath;
        _decorateLayer.fillColor = [UIColor cyanColor].CGColor;
    }
    return _decorateLayer;
}

- (CAShapeLayer *)coverLayer
{
    if (!_coverLayer) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        
        [path moveToPoint:CGPointMake(0, self.frame.size.height)];
        [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
        [path addLineToPoint:CGPointMake(self.frame.size.width / 2 + 5.f, self.frame.size.height * 2 / 7 + 4.f)];
        [path addQuadCurveToPoint:CGPointMake(self.frame.size.width / 2 - 5.f, self.frame.size.height * 2 / 7 + 4.f) controlPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height * 2 / 7)];
        [path addLineToPoint:CGPointMake(0, self.frame.size.height)];
        
        _coverLayer = [[CAShapeLayer alloc] init];
        _coverLayer.fillColor = self.fillColor;
        _coverLayer.path = path.CGPath;
    }
    return _coverLayer;
}

- (LetterLayer *)letterLayer
{
    if (!_letterLayer) {
        _letterLayer = [[LetterLayer alloc] initWithFrame:self.frame fillColor:self.fillColor];
    }
    return _letterLayer;
}

@end
