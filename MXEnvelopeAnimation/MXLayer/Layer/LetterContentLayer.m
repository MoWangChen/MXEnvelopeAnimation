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

- (void)drawInContext:(CGContextRef)ctx
{
    CGContextSetFillColorWithColor(ctx, [[UIColor darkTextColor] CGColor]);
    
    UIGraphicsPushContext(ctx);
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentCenter;
    
//    [@"¥90" drawInRect:CGRectMake(0, 10, self.frame.size.width, 40) withAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:36],NSParagraphStyleAttributeName:paragraph}];
    [@"111" drawWithRect:CGRectMake(0, 10, self.frame.size.width, 40) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:36],NSParagraphStyleAttributeName:paragraph} context:nil];
    
    [@"2222222" drawInRect:CGRectMake(0, 50, self.frame.size.width, 20) withAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14],NSParagraphStyleAttributeName:paragraph}];
    
    UIGraphicsPopContext();
}

@end
