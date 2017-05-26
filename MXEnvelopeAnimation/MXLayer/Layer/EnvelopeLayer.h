//
//  EnvolopeLayer.h
//  MXEnvelopeAnimation
//
//  Created by 谢鹏翔 on 2017/5/25.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface EnvelopeLayer : CAShapeLayer

- (instancetype)initWithFrame:(CGRect)frame;

- (void)moveDownAnimation;

@end
