//
//  UIBezierPath+AnimationPath.h
//  MXEnvelopeAnimation
//
//  Created by 谢鹏翔 on 2017/5/26.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (AnimationPath)

+ (UIBezierPath *)envelopeAnimationPath:(CALayer *)point distance:(CGFloat)distance;

@end
