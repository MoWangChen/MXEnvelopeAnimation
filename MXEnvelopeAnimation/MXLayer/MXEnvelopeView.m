//
//  MXEnvolopeView.m
//  MXEnvelopeAnimation
//
//  Created by 谢鹏翔 on 2017/5/25.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "MXEnvelopeView.h"
#import "EnvelopeLayer.h"

@interface MXEnvelopeView ()

@property (nonatomic, strong) EnvelopeLayer *envelopeLayer;

@end

@implementation MXEnvelopeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self addEnvelopeLayer];
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

- (void)addEnvelopeLayer
{
    [self.envelopeLayer setNeedsDisplay];
    [self.layer addSublayer:self.envelopeLayer];
    [_envelopeLayer moveDownAnimation];
}

- (EnvelopeLayer *)envelopeLayer
{
    if (!_envelopeLayer) {
        _envelopeLayer = [[EnvelopeLayer alloc] initWithFrame:self.bounds];
    }
    return _envelopeLayer;
}

@end
