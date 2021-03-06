//
//  OrderLayer.h
//  MXEnvelopeAnimation
//
//  Created by 谢鹏翔 on 2017/5/27.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface LetterLayer : CAShapeLayer

- (instancetype)initWithFrame:(CGRect)frame fillColor:(CGColorRef)color;

- (void)upLetterAnimation_SectionOne;
- (void)upLetterAnimation_SectionTwo;
- (void)upLetterAnimation_SectionThree;
- (void)upLetterAnimation_SectionFour;

@end
