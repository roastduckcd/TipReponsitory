//
//  RDTableDelegate.h
//  AppFunctionGroup
//
//  Created by yang song on 09/11/2017.
//  Copyright © 2017 yangsong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <ViewDeck/ViewDeck.h>

typedef void(^ShowModalBlock)(IIViewDeckController *vc);

@interface RDTableDelegate : NSObject <UITableViewDelegate>

@property (nonatomic, copy) ShowModalBlock modalBlock;


@end
