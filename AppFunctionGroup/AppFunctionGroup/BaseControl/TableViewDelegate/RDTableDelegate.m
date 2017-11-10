//
//  RDTableDelegate.m
//  AppFunctionGroup
//
//  Created by yang song on 09/11/2017.
//  Copyright © 2017 yangsong. All rights reserved.
//

#import "RDTableDelegate.h"

#import "IBManager.h"
#import "LeftViewController.h"
#import "CenterViewController.h"
#import "RightViewController.h"


@implementation RDTableDelegate

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    CenterViewController *center = [[CenterViewController alloc] initWithNibName:@"CenterViewController" bundle:[NSBundle mainBundle]]; //[IBManager instanceViewControllerWithNibName:@"CenterViewController"];
    LeftViewController *left = [IBManager instanceViewControllerWithStoryboardID:@"LeftViewController" inStoryboard:@"SideBar"];
    RightViewController *right = [IBManager instanceViewControllerWithStoryboardID:@"RightViewController" inStoryboard:@"SideBar"];

    IIViewDeckController *vc = [[IIViewDeckController alloc] initWithCenterViewController:center leftViewController:left rightViewController:right];

    self.modalBlock(vc);
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    return [[UIView alloc] init];
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 0.01;
//}
@end
