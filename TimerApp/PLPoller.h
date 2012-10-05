//
//  PCTimer.h
//  TimerApp
//
//  Created by Kasper Timm on 04/10/12.
//  Copyright (c) 2012 Kasper Timm. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^PLPollerBlock)(NSTimeInterval totalTimePassed);

// A class that keeps track of a repeating timer that polls the passed in block each time it fires
@interface PLPoller : NSObject

@property (nonatomic, readonly) NSTimeInterval pollTimeInterval;
@property (nonatomic, readonly) PLPollerBlock pollingBlock;

// default timeInterval is 60 seconds.
+ (PLPoller *)pollerWithBlock:(PLPollerBlock)pollingBlock; // required parameter; cannot be nil.
+ (PLPoller *)pollerWithTimeInterval:(NSTimeInterval)pollTimeInterval block:(PLPollerBlock)pollingBlock; // required parameters; cannot be nil.

- (void)start; // YOLO.
- (void)pause; // pauses polling.
- (void)stop; // stops the polling and resets the total time passed.

@end
