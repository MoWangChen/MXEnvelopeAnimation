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



@end

@implementation LetterContentLayer

- (instancetype)initWithFrame:(CGRect)frame fillColor:(CGColorRef)color
{
    self = [super init];
    if (self) {
        self.frame = frame;
        self.cornerRadius = 5.f;
    }
    return self;
}

- (void)drawInContext:(CGContextRef)ctx
{
    CGContextSetFillColorWithColor(ctx, [[UIColor darkTextColor] CGColor]);
    
    UIGraphicsPushContext(ctx);
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentCenter;
    
    [@"2222" drawInRect:CGRectMake(0, 10, self.frame.size.width, 40) withAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:30],NSParagraphStyleAttributeName:paragraph}];
    
    UIGraphicsPopContext();
}

@end
