//
//  PLTimer.m
//  TimerApp
//
//  Created by Kasper Timm on 04/10/12.
//  Copyright (c) 2012 Kasper Timm. All rights reserved.
//

#import "PLPoller.h"

@interface PLPoller ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) NSTimeInterval totalTimePassed;

@property (nonatomic, readwrite) NSTimeInterval pollTimeInterval;
@property (nonatomic, readwrite) PLPollerBlock pollingBlock;

@property (nonatomic, strong) NSDate *startDate;
@end

@implementation PLPoller

#define DEFAULT_TIME_INTERVAL 60

#pragma mark - NSObject

- (id)init
{
    self = [super init];
    if (!self) return nil;
    
    _totalTimePassed = 0;
    _pollTimeInterval = DEFAULT_TIME_INTERVAL;
    
    return self;
}

#pragma mark - Header

+ (PLPoller *)pollerWithBlock:(PLPollerBlock)pollingBlock
{
    return [self pollerWithTimeInterval:DEFAULT_TIME_INTERVAL block:pollingBlock];
}

+ (PLPoller *)pollerWithTimeInterval:(NSTimeInterval)pollTimeInterval block:(PLPollerBlock)pollingBlock
{
    if (!pollTimeInterval || !pollingBlock) return nil;
    
    PLPoller *poller = [[self alloc] init];
    poller.pollTimeInterval = pollTimeInterval;
    poller.pollingBlock = pollingBlock;
    
    return poller;
}

- (void)start
{
    if (!self.timer) {
        self.startDate = [NSDate date];
        self.timer = [NSTimer scheduledTimerWithTimeInterval:self.pollTimeInterval target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    }
}

- (void)pause
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)stop
{
    [self pause];
    self.totalTimePassed = 0;
    self.startDate = nil;
}

#pragma mark - Private

- (void)timerFired:(NSTimer *)timer
{
    NSTimeInterval totalTimePassed = -1*[self.startDate timeIntervalSinceNow]; // The start date is earlier than now, and will return a negative result.
    self.pollingBlock(totalTimePassed);
}

@end
