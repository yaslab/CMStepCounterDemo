//
//  AppDelegate.h
//  CMStepCounterDemo
//
//  Created by Hatta Yasuhiro on 2014/05/17.
//  Copyright (c) 2014年 yaslab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StepCounter.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// 唯一のオブジェクトはここに置いておく
@property (strong, nonatomic) StepCounter *stepCounter;

@end
