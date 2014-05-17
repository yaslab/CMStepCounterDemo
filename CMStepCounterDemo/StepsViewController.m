//
//  StepsViewController.m
//  CMStepCounterDemo
//
//  Created by Hatta Yasuhiro on 2014/05/17.
//  Copyright (c) 2014年 yaslab. All rights reserved.
//

#import "StepsViewController.h"
#import "AppDelegate.h"
#import "YLDateTime.h"

@interface StepsViewController ()

@property (weak, nonatomic) StepCounter *stepCounter;

@end

@implementation StepsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stepCounterDidUpdate:) name:kNoteStepCounterDidUpdate object:nil];

    self.stepCounter = ((AppDelegate *)[UIApplication sharedApplication].delegate).stepCounter;

    if ([self.stepCounter isAvailable]) {
        [self stepCounterDidUpdate:nil];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Notification

- (void)stepCounterDidUpdate:(NSNotification *)note
{
    YLDateTime *start = [YLDateTime today];
    YLDateTime *end = [YLDateTime now];

    self.dateLabel.text = [NSString stringWithFormat:@"%04d/%02d/%02d", (int)start.year, (int)start.month, (int)start.day];
    self.timeLabel.text = [NSString stringWithFormat:@"%02d:%02d:%02d - %02d:%02d:%02d", (int)start.hour, (int)start.minute, (int)start.second, (int)end.hour, (int)end.minute, (int)end.second];

    NSInteger steps = [self.stepCounter stepCountStartingFrom:start.nsdate to:end.nsdate];
    self.stepsLabel.text = [NSString stringWithFormat:@"%d steps", (int)steps];
}

@end
