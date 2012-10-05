//
//  PCViewController.m
//  TimerApp
//
//  Created by Kasper Timm on 04/10/12.
//  Copyright (c) 2012 Kasper Timm. All rights reserved.
//

#import "PLPollerViewController.h"
#import "PLPoller.h"

@implementation PLPollerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.poller = [PLPoller pollerWithBlock:^(NSTimeInterval totalTimePassed) {
        self.timerLabel.text = [NSString stringWithFormat:@"%f", totalTimePassed];
    }];
}

- (IBAction)start:(id)sender {
    [self.poller start];
}

- (IBAction)pause:(id)sender {
    [self.poller pause];
}

- (IBAction)stop:(id)sender {
    [self.poller stop];
}
@end
