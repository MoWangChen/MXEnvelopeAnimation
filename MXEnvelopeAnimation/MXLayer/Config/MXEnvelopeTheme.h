//
//  MXEnvelopeTheme.h
//  MXEnvelopeAnimation
//
//  Created by 谢鹏翔 on 2017/6/5.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MXEnvelopeColor : NSObject

+ (MXEnvelopeColor *)defaultTheme;

// 主色
@property (nonatomic, strong) UIColor *mainColor;
//渐变主色
@property (nonatomic, strong) UIColor *gradientLeftColor;
@property (nonatomic, strong) UIColor *gradientRightColor;

@property (nonatomic, strong) UIColor *decorateColor;

@end

@interface MXEnvelopeTheme : NSObject

@property (nonatomic, strong) MXEnvelopeColor *current;

+ (MXEnvelopeColor *)currentTheme;

- (void)setup;

@end
