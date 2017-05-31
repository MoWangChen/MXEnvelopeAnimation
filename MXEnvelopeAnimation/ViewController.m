//
//  ViewController.m
//  MXEnvelopeAnimation
//
//  Created by 谢鹏翔 on 2017/5/25.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "ViewController.h"
#import "MXEnvelopeView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor purpleColor];
    
    MXEnvelopeView *envelopeView = [[MXEnvelopeView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH * 2 / 15, 100, SCREEN_WIDTH * 11 / 15, SCREEN_WIDTH * 77 / 207)];
    [self.view addSubview:envelopeView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
