//
//  HistoryViewController.m
//  CMStepCounterDemo
//
//  Created by Hatta Yasuhiro on 2014/05/17.
//  Copyright (c) 2014年 yaslab. All rights reserved.
//

#import "HistoryViewController.h"
#import "HistoryCell.h"
#import "TableSection.h"
#import "HistoryRow.h"
#import "AppDelegate.h"
#import "YLDateTime.h"

static NSString * const kCellIdHistory = @"HistoryCell";

@interface HistoryViewController ()

@property (weak, nonatomic) StepCounter *stepCounter;
@property (nonatomic) NSMutableArray *sections;
@property (nonatomic) NSInteger maxSteps;

@end

@implementation HistoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    UIEdgeInsets contentInset = self.tableView.contentInset;
    contentInset.top = [UIApplication sharedApplication].statusBarFrame.size.height;
    self.tableView.contentInset = contentInset;

    self.stepCounter = ((AppDelegate *)[UIApplication sharedApplication].delegate).stepCounter;

    self.sections = [NSMutableArray new];
    [self.sections addObject:[TableSection new]];

    self.maxSteps = 0;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    if (![self.stepCounter isAvailable]) {
        return;
    }

    TableSection *section = self.sections[0];
    [section.rows removeAllObjects];

    YLDateTime *start = [YLDateTime today];
    YLDateTime *end = [start dateByAddingDay:1];
    self.maxSteps = 0;
    for (NSInteger i = 0; i < 7; i++) {
        HistoryRow *row = [HistoryRow new];
        row.cellIdentifier = kCellIdHistory;
        row.year = start.year;
        row.month = start.month;
        row.day = start.day;
        row.stepCount = [self.stepCounter stepCountStartingFrom:start.nsdate to:end.nsdate];
        [section.rows addObject:row];
        self.maxSteps = MAX(self.maxSteps, row.stepCount);
        end = start;
        start = [end dateByAddingDay:-1];
    }

    // 最大値を切り上げ
    if (self.maxSteps < 2500) {
        self.maxSteps = 2500;
    }
    else if (self.maxSteps < 5000) {
        self.maxSteps = 5000;
    }
    else if (self.maxSteps < 10000) {
        self.maxSteps = 10000;
    }
    else if (self.maxSteps < 15000) {
        self.maxSteps = 15000;
    }
    else if (self.maxSteps < 20000) {
        self.maxSteps = 20000;
    }
    else {
        // そのまま
    }

    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ((TableSection *)self.sections[section]).rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableRow *_row = ((TableSection *)self.sections[indexPath.section]).rows[indexPath.row];
    UITableViewCell *_cell = [tableView dequeueReusableCellWithIdentifier:_row.cellIdentifier forIndexPath:indexPath];

    // Configure the cell...
    if ([_row.cellIdentifier isEqualToString:kCellIdHistory]) {
        HistoryRow *row = (HistoryRow *)_row;
        HistoryCell *cell = (HistoryCell *)_cell;

        cell.titleLabel.text = [NSString stringWithFormat:@"%04d/%02d/%02d", (int)row.year, (int)row.month, (int)row.day];
        cell.subTitleLabel.text = [NSString stringWithFormat:@"%d", (int)row.stepCount];
        cell.progress.progress = (float)row.stepCount / (float)self.maxSteps;
    }

    return _cell;
}

@end
