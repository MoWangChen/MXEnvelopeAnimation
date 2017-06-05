//
//  ColourSideLayer.m
//  edu
//
//  Created by 谢鹏翔 on 2017/6/5.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "ColourSideLayer.h"
#import "MXEnvelopeTheme.h"

#define kSelfFrameWidth (self.frame.size.width)
#define kStartPointX (3.f)
#define kStartPointY (self.frame.size.height / 10)
#define kRhombusPartHeight (self.frame.size.height * 9 / 10 / 7)
#define kRhombusWidth 5.f
#define kRhombusHeight 10.f

@implementation ColourSideLayer

- (instancetype)initWithFrame:(CGRect)frame fillColor:(CGColorRef)color
{
    self = [super init];
    if (self) {
        self.frame = frame;
        self.contentsScale = [UIScreen mainScreen].scale;
    }
    return self;
}

- (void)drawInContext:(CGContextRef)ctx
{
    UIGraphicsPushContext(ctx);
    
    CGContextSetFillColorWithColor(ctx, [[UIColor lightGrayColor] CGColor]);
    [self drawSideRhombus:ctx part:0];
    
    CGContextSetFillColorWithColor(ctx, [[MXEnvelopeTheme currentTheme].decorateColor CGColor]);
    [self drawSideRhombus:ctx part:1];
    
    UIGraphicsPopContext();
}

- (void)drawSideRhombus:(CGContextRef)ctx part:(int)part
{
    for (int i = 0; i < 7; i++) {
        if (i % 2 == part) {
            // 左侧side
            CGContextMoveToPoint(ctx, kStartPointX , kStartPointY + i * kRhombusPartHeight);
            CGContextAddLineToPoint(ctx, kStartPointX , kStartPointY + i * kRhombusPartHeight + kRhombusHeight);
            CGContextAddLineToPoint(ctx, kStartPointX + kRhombusWidth, kStartPointY + i * kRhombusPartHeight + kRhombusHeight - kRhombusWidth);
            CGContextAddLineToPoint(ctx, kStartPointX + kRhombusWidth, kStartPointY + i * kRhombusPartHeight - kRhombusWidth);
            CGContextAddLineToPoint(ctx, kStartPointX, kStartPointY + i * kRhombusPartHeight);
            
            // 右侧side
            CGContextMoveToPoint(ctx, kSelfFrameWidth - kStartPointX , kStartPointY + i * kRhombusPartHeight);
            CGContextAddLineToPoint(ctx, kSelfFrameWidth - kStartPointX , kStartPointY + i * kRhombusPartHeight + kRhombusHeight);
            CGContextAddLineToPoint(ctx, kSelfFrameWidth - kStartPointX - kRhombusWidth, kStartPointY + i * kRhombusPartHeight + kRhombusHeight - kRhombusWidth);
            CGContextAddLineToPoint(ctx, kSelfFrameWidth - kStartPointX - kRhombusWidth, kStartPointY + i * kRhombusPartHeight - kRhombusWidth);
            CGContextAddLineToPoint(ctx, kSelfFrameWidth - kStartPointX, kStartPointY + i * kRhombusPartHeight);
        }
    }
    CGContextFillPath(ctx);
}

@end
