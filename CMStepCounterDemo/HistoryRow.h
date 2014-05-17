//
//  HistoryRow.h
//  CMStepCounterDemo
//
//  Created by Hatta Yasuhiro on 2014/05/17.
//  Copyright (c) 2014年 yaslab. All rights reserved.
//

#import "TableRow.h"

@interface HistoryRow : TableRow

@property (nonatomic) NSInteger year;
@property (nonatomic) NSInteger month;
@property (nonatomic) NSInteger day;
@property (nonatomic) NSInteger stepCount;

@end
