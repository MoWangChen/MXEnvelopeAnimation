//
//  MXEnvolopeView.m
//  MXEnvelopeAnimation
//
//  Created by 谢鹏翔 on 2017/5/25.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "MXEnvelopeView.h"
#import "EnvelopeLayer.h"
#import "MXEnvelopeTheme.h"

@interface MXEnvelopeView ()

@property (nonatomic, strong) CAGradientLayer *backLayer;
@property (nonatomic, strong) EnvelopeLayer *envelopeLayer;

@end

@implementation MXEnvelopeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addSubLayer];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    [super drawLayer:layer inContext:ctx];
}

- (void)addSubLayer
{
    [self.layer addSublayer:self.backLayer];
    
    [self.envelopeLayer setNeedsDisplay];
    [self.layer addSublayer:self.envelopeLayer];
    [_envelopeLayer moveDownAnimation];
}

- (EnvelopeLayer *)envelopeLayer
{
    if (!_envelopeLayer) {
        CGRect frame = CGRectMake(SCREEN_WIDTH * 2 / 15, 40, SCREEN_WIDTH * 11 / 15, SCREEN_WIDTH * 77 / 207);
        _envelopeLayer = [[EnvelopeLayer alloc] initWithFrame:frame];
    }
    return _envelopeLayer;
}

- (CAGradientLayer *)backLayer
{
    if (!_backLayer) {
        CAGradientLayer *layer = [CAGradientLayer layer];
        layer.colors = @[(__bridge id)[MXEnvelopeTheme currentTheme].gradientLeftColor.CGColor,(__bridge id)[MXEnvelopeTheme currentTheme].gradientRightColor.CGColor];
        layer.locations = @[@0.f, @1.f];
        layer.startPoint = CGPointMake(0, 0);
        layer.endPoint = CGPointMake(1.0, 1.0);
        layer.frame = self.bounds;
        _backLayer = layer;
    }
    return _backLayer;
}


@end
