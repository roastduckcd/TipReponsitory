//
//  RDTableDatasource.h
//  AppFunctionGroup
//
//  Created by yang song on 09/11/2017.
//  Copyright © 2017 yangsong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface RDTableDatasource : NSObject <UITableViewDataSource>

- (instancetype)initWithTableView:(UITableView *)tableView withData:(NSArray *)items usingNib:(BOOL)usingNib;

@end
