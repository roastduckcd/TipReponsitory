//
//  BaseViewController.m
//  AppFunctionGroup
//
//  Created by yang song on 08/11/2017.
//  Copyright © 2017 yangsong. All rights reserved.
//

#import "BaseViewController.h"

#import "RDTableDelegate.h"
#import "RDTableDatasource.h"

@interface BaseViewController ()

#pragma mark - static_ or define variable

#pragma mark - Ui property
@property (nonatomic, strong) UITableView *tableView;

#pragma mark - Handle or Manager property
@property (nonatomic, strong) RDTableDatasource *datasource;
@property (nonatomic, strong) RDTableDelegate *delegate;

#pragma mark - Data property
@property (nonatomic, strong) NSArray *functionNameArray;


@end

@implementation BaseViewController

#pragma mark - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];

//    self.navigationController.in  teractivePopGestureRecognizer.delegate = nil;

    [self.view addSubview:self.tableView];
}

#pragma mark - setter getter lazyloading
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];

        self.datasource = [[RDTableDatasource alloc] initWithTableView:self.tableView withData:self.functionNameArray usingNib:YES];
        self.tableView.dataSource = self.datasource;

        self.delegate = [[RDTableDelegate alloc] init];
        // 不能直接赋值：init引用计数加1，weak减1，对象引用计数为0被释放
//        self.tableView.delegate = [[RDTableDelegate alloc] init];
        // self.delegate 使引用计数又加1，对象引用计数为1
        self.tableView.delegate = self.delegate;

        __weak typeof(self) weakSelf = self;
        self.delegate.modalBlock = ^(IIViewDeckController *vc) {
            /*
             *  与NavigationController的左滑返回冲突
             *  如果取消左滑返回，会造成pop到首页后，左滑，再点击cell无反应
             *  使用present规避，如需push效果，需要重写。
             */
//            [weakSelf.navigationController pushViewController:vc animated:YES];
            [weakSelf presentViewController:vc animated:YES completion:nil];
        };

        // 和viewforfootview方法 不同效果？？？？
        self.tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}

- (NSArray *)functionNameArray {
    if (!_functionNameArray) {
        _functionNameArray = @[@"侧边栏"];
    }
    return _functionNameArray;
}

#pragma mark - IBActions

#pragma mark - Public method

#pragma mark - Private method

#pragma mark - Protocol conformance

#pragma mark - UITextFieldDelegate

#pragma mark - UITableViewDataSource

#pragma mark - UITableViewDelegate

#pragma mark - NSCopying

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
