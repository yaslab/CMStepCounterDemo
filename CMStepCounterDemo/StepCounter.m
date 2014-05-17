//
//  StepCounter.m
//  CMStepCounterDemo
//
//  Created by Hatta Yasuhiro on 2014/05/17.
//  Copyright (c) 2014年 yaslab. All rights reserved.
//

#import "StepCounter.h"
#import <CoreMotion/CoreMotion.h>

NSString * const kNoteStepCounterDidUpdate = @"kNoteStepCounterDidUpdate";

@interface StepCounter ()

@property (nonatomic) CMStepCounter *stepCounter;

@end

@implementation StepCounter

- (CMStepCounter *)stepCounter
{
    if (![CMStepCounter isStepCountingAvailable]) {
        _stepCounter = nil;
    }
    else if (!_stepCounter) {
        _stepCounter = [CMStepCounter new];
    }
    return _stepCounter;
}

- (BOOL)isAvailable
{
    if (self.stepCounter) {
        return YES;
    }
    return NO;
}

- (NSInteger)stepCountStartingFrom:(NSDate *)start to:(NSDate *)end
{
    __block NSInteger steps = -1;
    if (self.stepCounter) {
        // 同期用セマフォ
        dispatch_semaphore_t sema = dispatch_semaphore_create(0);
        // 別スレッドのOperationQueueで歩数を取得
        NSOperationQueue *q = [NSOperationQueue new];
        [self.stepCounter queryStepCountStartingFrom:start to:end toQueue:q withHandler:^(NSInteger numberOfSteps, NSError *error) {
            // 歩数を取得
            steps = numberOfSteps;
            // セマフォにシグナルを送る
            dispatch_semaphore_signal(sema);
        }];
        // セマフォにシグナルが送られてくるのを待つ
        dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    }
    return steps;
}

- (void)start
{
    NSLog(@"StepCounter start");
    if (self.stepCounter) {
        // 歩数の更新の監視を開始する
        [self.stepCounter startStepCountingUpdatesToQueue:[NSOperationQueue mainQueue] updateOn:1 withHandler:^(NSInteger numberOfSteps, NSDate *timestamp, NSError *error) {
            NSLog(@"StepCounter update");
            // 歩数が更新されたとき、NotificationCenterで通知する
            [[NSNotificationCenter defaultCenter] postNotificationName:kNoteStepCounterDidUpdate object:self];
        }];
    }
}

- (void)stop
{
    NSLog(@"StepCounter stop");
    if (self.stepCounter) {
        // 歩数の更新の監視をやめる
        [self.stepCounter stopStepCountingUpdates];
    }
}

@end
