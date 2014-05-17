//
//  HistoryCell.m
//  CMStepCounterDemo
//
//  Created by Hatta Yasuhiro on 2014/05/17.
//  Copyright (c) 2014年 yaslab. All rights reserved.
//

#import "HistoryCell.h"

@implementation HistoryCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
