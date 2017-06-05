//
//  LetterContentLayer.h
//  MXEnvelopeAnimation
//
//  Created by 谢鹏翔 on 2017/5/31.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#define KAnimationBeginTime (2.f/3.f)
#define KAnimationDuration (2.f/3.f)

@interface LetterContentLayer : CAShapeLayer

- (instancetype)initWithFrame:(CGRect)frame fillColor:(CGColorRef)color;

- (void)fixContentPositionAnimation;

@end
