//
//  MXEnvelopeTheme.m
//  MXEnvelopeAnimation
//
//  Created by 谢鹏翔 on 2017/6/5.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "MXEnvelopeTheme.h"

#define HEXCOLOR(hexValue) [UIColor colorWithRed:((CGFloat)((hexValue & 0xFF0000) >> 16))/255.0 green:((CGFloat)((hexValue & 0xFF00) >> 8))/255.0 blue:((CGFloat)(hexValue & 0xFF))/255.0 alpha:1.0]

@implementation MXEnvelopeColor

+ (MXEnvelopeColor *)defaultTheme
{
    MXEnvelopeColor *theme = [[MXEnvelopeColor alloc] init];
    theme.mainColor = HEXCOLOR(0x17bfb5);
    theme.gradientLeftColor = HEXCOLOR(0x2bc6ab);
    theme.gradientRightColor = HEXCOLOR(0x149daa);
    theme.decorateColor = HEXCOLOR(0x2bc6ab);
    return theme;
}

@end

@implementation MXEnvelopeTheme

+(instancetype)sharedInstance{
    static MXEnvelopeTheme *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [MXEnvelopeTheme new];
    });
    return sharedInstance;
}

+ (MXEnvelopeColor *)currentTheme
{
    if (![MXEnvelopeTheme sharedInstance].current) {
        [[MXEnvelopeTheme sharedInstance] setup];
    }
    return [MXEnvelopeTheme sharedInstance].current;
}

- (void)setup
{
    if (self.current == nil) {
        self.current = [MXEnvelopeColor defaultTheme];
    }
}

@end
