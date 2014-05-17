//
//  TableSection.m
//  CMStepCounterDemo
//
//  Created by Hatta Yasuhiro on 2014/05/17.
//  Copyright (c) 2014年 yaslab. All rights reserved.
//

#import "TableSection.h"

@implementation TableSection

- (id)init
{
    self = [super init];
    if (self) {
        self.header = nil;
        self.footer = nil;
        self.rows = [NSMutableArray new];
    }
    return self;
}

@end
