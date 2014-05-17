//
//  HistoryCell.h
//  CMStepCounterDemo
//
//  Created by Hatta Yasuhiro on 2014/05/17.
//  Copyright (c) 2014年 yaslab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *progress;

@end
