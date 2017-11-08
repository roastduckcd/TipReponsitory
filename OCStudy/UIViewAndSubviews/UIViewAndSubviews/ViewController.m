//
//  ViewController.m
//  UIViewAndSubviews
//
//  Created by yang song on 06/11/2017.
//  Copyright © 2017 yangsong. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()
@property (nonatomic, strong) MyView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myView = [[MyView alloc] initWithFrame:CGRectMake(10, 10, self.view.frame.size.width - 10 * 2, self.view.frame.size.height - 10 * 2)];
    [self.view addSubview:self.myView];


    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 300, 30)];
    label.text = @"test nooonononono";
    [self.myView addSubview:label];



    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    [button setTitle:@"按钮" forState: UIControlStateNormal];
    [button addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
    [self.myView addSubview:button];

//    myView.frame = CGRectMake(30, 30, 100, 100);

}

- (void)clicked {

//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 100, 30)];
//    label.text = @"test";
//    [self.myView addSubview: label];

//    self.myView.frame = CGRectMake(10, 10, 10, 10);
//    self.myView.bounds = CGRectMake(0, 0, 10, 10);

//    [self.myView setNeedsLayout];
//    [self.myView layoutIfNeeded];
//    [self.myView setNeedsDisplay];
}


@end
