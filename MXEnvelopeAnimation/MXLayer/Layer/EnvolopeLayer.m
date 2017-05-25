//
//  EnvolopeLayer.m
//  MXEnvelopeAnimation
//
//  Created by 谢鹏翔 on 2017/5/25.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "EnvolopeLayer.h"
#import <UIKit/UIKit.h>

@interface EnvolopeLayer ()

@property (nonatomic, strong) UIBezierPath *coverPath;
@property (nonatomic, strong) UIBezierPath *outlinePath;
@property (nonatomic, strong) UIBezierPath *inlinePath;

@end

@implementation EnvolopeLayer

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        self.frame = frame;
    }
    return self;
}

- (UIBezierPath *)coverPath
{
    if (!_coverPath) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, self.frame.size.height)];
        [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
    }
}

- (UIBezierPath *)outlinePath
{
    if (!_outlinePath) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, 0)];
        [path addLineToPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
        [path addLineToPoint:CGPointMake(self.frame.size.width, 0)];
        [path addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
        [path addLineToPoint:CGPointMake(0, self.frame.size.height)];
        [path addLineToPoint:CGPointMake(0, 0)];
        _outlinePath = path;
    }
    
    return _outlinePath;
}

- (void)







@end
