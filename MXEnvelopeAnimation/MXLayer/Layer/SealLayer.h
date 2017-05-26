//
//  SealLayer.h
//  MXEnvelopeAnimation
//
//  Created by 谢鹏翔 on 2017/5/26.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface SealLayer : CAShapeLayer

- (instancetype)initWithFrame:(CGRect)frame fillColor:(CGColorRef)color;

- (void)openEnvelopeAnimation;

@end
