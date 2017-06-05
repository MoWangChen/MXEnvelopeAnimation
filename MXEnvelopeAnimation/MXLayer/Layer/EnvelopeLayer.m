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
#import "MXEnvelopeTheme.h"
#import "ColourSideLayer.h"

@interface EnvelopeLayer ()

@property (nonatomic, strong) CAShapeLayer *shadowLayer;
@property (nonatomic, strong) SealLayer *sealLayer;
@property (nonatomic, strong) CAShapeLayer *outlineLayer;
@property (nonatomic, strong) ColourSideLayer *sideLayer;
@property (nonatomic, strong) CAGradientLayer *decorateLayer;
@property (nonatomic, strong) CAShapeLayer *coverLayer;

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
    [self.sideLayer setNeedsDisplay];
    [self addSublayer:self.sideLayer];
    
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.path = [UIBezierPath envelopeAnimationPath:self distance:100.f].CGPath;
    keyAnimation.fillMode = kCAFillModeForwards;
    keyAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    keyAnimation.duration = 1.f;
    keyAnimation.removedOnCompletion = NO;
    [self addAnimation:keyAnimation forKey:@"moveAnimation"];
    
    [self.sealLayer openEnvelopeAnimation];
    [self moveLetterUpAnimation];
}

- (void)moveLetterUpAnimation
{
    [self.letterLayer setNeedsDisplay];
    [self insertSublayer:self.letterLayer below:self.outlineLayer];
    [self.letterLayer upLetterAnimation_SectionOne];
    [self.letterLayer upLetterAnimation_SectionTwo];
    [self.letterLayer upLetterAnimation_SectionThree];
    [self.letterLayer upLetterAnimation_SectionFour];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((2.f/3.f) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _letterLayer = nil;
        [self.letterLayer setNeedsDisplay];
        [self insertSublayer:self.letterLayer below:self.outlineLayer];
        [self.letterLayer upLetterAnimation_SectionOne];
        [self.letterLayer upLetterAnimation_SectionTwo];
        [self.letterLayer upLetterAnimation_SectionThree];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((4.f/3.f) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _letterLayer = nil;
        [self.letterLayer setNeedsDisplay];
        [self insertSublayer:self.letterLayer below:self.outlineLayer];
        [self.letterLayer upLetterAnimation_SectionOne];
        [self.letterLayer upLetterAnimation_SectionTwo];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((6.f/3.f) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _letterLayer = nil;
        [self.letterLayer setNeedsDisplay];
        [self insertSublayer:self.letterLayer below:self.outlineLayer];
        [self.letterLayer upLetterAnimation_SectionOne];
    });
}

- (CAShapeLayer *)shadowLayer
{
    if (!_shadowLayer) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0.f, -0.5f)];
        [path addLineToPoint:CGPointMake(self.frame.size.width, -0.5f)];
        [path addLineToPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
        [path addLineToPoint:CGPointMake(0.f, -0.5f)];
        _shadowLayer = [[CAShapeLayer alloc] init];
        _shadowLayer.fillColor = [UIColor colorWithWhite:1.0 alpha:0.6].CGColor;
        _shadowLayer.path = path.CGPath;
    }
    return _shadowLayer;
}

- (SealLayer *)sealLayer
{
    if (!_sealLayer) {
        _sealLayer = [[SealLayer alloc] initWithFrame:self.bounds fillColor:self.fillColor];
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

- (ColourSideLayer *)sideLayer
{
    if (!_sideLayer) {
        _sideLayer = [[ColourSideLayer alloc] initWithFrame:self.bounds fillColor:self.fillColor];
    }
    return _sideLayer;
}

- (CAGradientLayer *)decorateLayer
{
    if (!_decorateLayer) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        
        [path moveToPoint:CGPointMake(0.f, 0.f)];
        [path addLineToPoint:CGPointMake(self.frame.size.width * 25 / 69, self.frame.size.height * 25 / 69)];
        [path addLineToPoint:CGPointMake(0.f, self.frame.size.height)];
        [path addLineToPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height * 28 / 69)];
        [path addLineToPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height * 2 / 7 - 10.f)];
        [path addLineToPoint:CGPointMake(self.frame.size.width * 30 / 69, self.frame.size.height * 21 / 69)];
        [path addLineToPoint:CGPointMake(0.f, 0.f)];
        
        [path moveToPoint:CGPointMake(self.frame.size.width, 0.f)];
        [path addLineToPoint:CGPointMake(self.frame.size.width * 44 / 69, self.frame.size.height * 25 / 69)];
        [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
        [path addLineToPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height * 28 / 69)];
        [path addLineToPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height * 2 / 7 - 10.f)];
        [path addLineToPoint:CGPointMake(self.frame.size.width * 39 / 69, self.frame.size.height * 21 / 69)];
        [path addLineToPoint:CGPointMake(self.frame.size.width, 0.f)];
        
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        
        CAGradientLayer *layer = [CAGradientLayer layer];
        layer.colors = @[(__bridge id)[UIColor whiteColor].CGColor,(__bridge id)[MXEnvelopeTheme currentTheme].decorateColor.CGColor];
        layer.locations = @[@0.f, @0.5f, @1.f];
        layer.startPoint = CGPointMake(0, 0);
        layer.endPoint = CGPointMake(1.0, 0);
        layer.frame = self.bounds;
        layer.mask = shapeLayer;
        layer.opacity = 0.5;
        
        _decorateLayer = layer;
        
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
        _letterLayer = [[LetterLayer alloc] initWithFrame:self.bounds fillColor:self.fillColor];
    }
    return _letterLayer;
}

@end
