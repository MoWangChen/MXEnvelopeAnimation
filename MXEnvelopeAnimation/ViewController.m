//
//  ViewController.m
//  MXEnvelopeAnimation
//
//  Created by 谢鹏翔 on 2017/5/25.
//  Copyright © 2017年 365ime. All rights reserved.
//

#import "ViewController.h"
#import "MXEnvelopeView.h"

#import "LetterLayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    
    MXEnvelopeView *envelopeView = [[MXEnvelopeView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_WIDTH * 77 / 207 + 150)];
    [self.view addSubview:envelopeView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
