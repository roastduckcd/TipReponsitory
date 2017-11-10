//
//  IBManager.h
//  AppFunctionGroup
//
//  Created by yang song on 09/11/2017.
//  Copyright © 2017 yangsong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IBManager : NSObject

+ (nonnull __kindof UIViewController *)instanceViewControllerWithStoryboardID:(nonnull NSString *)ID inStoryboard:(nonnull NSString *)name;
+ (nonnull UIStoryboard *)fetchStoryboardWithName:(nonnull NSString *)name;

+ (nonnull __kindof UIViewController *)instanceViewControllerWithNibName:(nonnull NSString *)name;

@end
