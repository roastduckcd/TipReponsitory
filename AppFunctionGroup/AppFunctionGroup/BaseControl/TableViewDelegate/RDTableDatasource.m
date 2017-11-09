//
//  RDTableDatasource.m
//  AppFunctionGroup
//
//  Created by yang song on 09/11/2017.
//  Copyright © 2017 yangsong. All rights reserved.
//

#import "RDTableDatasource.h"
#import "RDTableViewCell.h"

#define NIBNAME @"RDTableViewCell"
#define CELLID  @"CellIdentifier"

@interface RDTableDatasource()

@property (nonatomic, strong) UITableView *tableView;


@property (nonatomic, strong) NSArray *items;
@property (nonatomic, assign) BOOL isUsingNib;

@end

@implementation RDTableDatasource

- (instancetype)initWithTableView:(UITableView *)tableView withData:(NSArray *)items usingNib:(BOOL)usingNib {
    if (self = [super init]) {
        self.tableView = tableView;
        self.items = items;
        self.isUsingNib = usingNib;

        [self registerCell];
    }
    return self;
}

- (void)registerCell {
    if (self.isUsingNib) {
        [self.tableView registerNib:[UINib nibWithNibName:NIBNAME bundle:[NSBundle mainBundle]] forCellReuseIdentifier:CELLID];
    } else {
        [self.tableView registerClass:[RDTableViewCell class] forCellReuseIdentifier:CELLID];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tableView.separatorColor = [UIColor purpleColor];
    [cell configedWithData:self.items[indexPath.row]];
    return cell;
}

@end
