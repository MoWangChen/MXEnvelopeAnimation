//
//  LetterContentLayer.m
//  MXEnvelopeAnimation
//
//  Created by 谢鹏翔 on 2017/5/31.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "LetterContentLayer.h"
#import <UIKit/UIKit.h>

@interface LetterContentLayer ()

@property (nonatomic, strong) CATextLayer *titleLayer;
@property (nonatomic, strong) CATextLayer *subTitleLayer;

@end

@implementation LetterContentLayer

- (instancetype)initWithFrame:(CGRect)frame fillColor:(CGColorRef)color
{
    self = [super init];
    if (self) {
        self.frame = frame;
        self.cornerRadius = 5.f;
        [self addSublayer:self.titleLayer];
        [self addSublayer:self.subTitleLayer];
    }
    return self;
}

- (void)fixContentPositionAnimation
{
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation1.fromValue = @(self.frame.size.height / 2);
    animation1.toValue = @(0.f);
    animation1.beginTime = KAnimationBeginTime;
    animation1.duration = KAnimationDuration;
    
    CAAnimationGroup *animationGroup = [[CAAnimationGroup alloc] init];
    animationGroup.animations = @[animation1];
    animationGroup.duration = KAnimationDuration + KAnimationDuration;
    animationGroup.repeatCount = 1;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    [self addAnimation:animationGroup forKey:nil];
}


- (CATextLayer *)titleLayer
{
    if (!_titleLayer) {
        UIFont *font = [UIFont boldSystemFontOfSize:36.f];
        CFStringRef fontName = (__bridge CFStringRef)font.fontName;
        CGFontRef fontRef = CGFontCreateWithFontName(fontName);
        
        CATextLayer *layer = [CATextLayer layer];
        layer.string = @"1111";
        layer.frame = CGRectMake(0, 10, self.frame.size.width, 40);
        layer.font = fontRef;
        layer.fontSize = font.pointSize;
        layer.alignmentMode = kCAAlignmentCenter;
        layer.foregroundColor = [[UIColor darkTextColor] CGColor];
        layer.wrapped = YES;
        layer.contentsScale = [UIScreen mainScreen].scale;
        _titleLayer = layer;
    }
    return _titleLayer;
}

- (CATextLayer *)subTitleLayer
{
    if (!_subTitleLayer) {
        UIFont *font = [UIFont boldSystemFontOfSize:14.f];
        CFStringRef fontName = (__bridge CFStringRef)font.fontName;
        CGFontRef fontRef = CGFontCreateWithFontName(fontName);
        
        CATextLayer *layer = [CATextLayer layer];
        layer.string = @"2222";
        layer.frame = CGRectMake(0, 50, self.frame.size.width, 40);
        layer.font = fontRef;
        layer.fontSize = font.pointSize;
        layer.alignmentMode = kCAAlignmentCenter;
        layer.foregroundColor = [[UIColor darkTextColor] CGColor];
        layer.wrapped = YES;
        layer.contentsScale = [UIScreen mainScreen].scale;
        _subTitleLayer = layer;
    }
    return _subTitleLayer;
}
@end
