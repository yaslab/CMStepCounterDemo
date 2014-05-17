//
//  StepCounter.h
//  CMStepCounterDemo
//
//  Created by Hatta Yasuhiro on 2014/05/17.
//  Copyright (c) 2014年 yaslab. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kNoteStepCounterDidUpdate;

@interface StepCounter : NSObject

- (BOOL)isAvailable;
- (NSInteger)stepCountStartingFrom:(NSDate *)start to:(NSDate *)end;
- (void)start;
- (void)stop;

@end
