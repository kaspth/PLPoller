//
//  PCViewController.h
//  TimerApp
//
//  Created by Kasper Timm on 04/10/12.
//  Copyright (c) 2012 Kasper Timm. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PLPoller;

@interface PLPollerViewController : UIViewController

@property (nonatomic, strong) PLPoller *poller;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

- (IBAction)start:(UIButton *)sender;
- (IBAction)pause:(UIButton *)sender;
- (IBAction)stop:(UIButton *)sender;
@end
