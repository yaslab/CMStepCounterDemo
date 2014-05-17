//
//  TableSection.h
//  CMStepCounterDemo
//
//  Created by Hatta Yasuhiro on 2014/05/17.
//  Copyright (c) 2014年 yaslab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableSection : NSObject

@property (nonatomic) NSString *header;
@property (nonatomic) NSString *footer;
@property (nonatomic) NSMutableArray *rows;

@end
