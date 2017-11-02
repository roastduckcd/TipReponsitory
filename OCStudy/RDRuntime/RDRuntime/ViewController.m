//
//  ViewController.m
//  RDRuntime
//
//  Created by yang song on 01/11/2017.
//  Copyright © 2017 yangsong. All rights reserved.
//

#import "ViewController.h"

#import <objc/message.h>

@interface ViewController ()

@property (nonatomic, strong) UIButton *but;
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, strong) UIView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 获取方法地址
//    IMP addr = [self methodForSelector:@selector(showSome)];
//
//
//    [ViewController resolveClassMethod:@selector(showSome)];
//    char a[] = @encode(ViewController);

    unsigned int count = 0;
    objc_property_t *list = class_copyPropertyList(objc_getClass("ViewController"), &count);
    for (int i=0; i<3; i++) {

        const char *name = property_getName(list[i]);
        const char *encode = property_getAttributes(list[i]);
        objc_property_t ref = class_getProperty([self class], name);
        printf("名字：%s === 属性编码：%s === 属性引用：%p", name, encode, ref);
    }

}

// objc_msgSend
- (void)showSome {
    NSLog(@"show了");
}
- (void)showNothing {
    NSLog(@"来了");
}
// 动态提供方法实现
+ (BOOL)resolveClassMethod:(SEL)sel {
    if (sel == @selector(showSome)) {
        class_addMethod([self class], sel, [self methodForSelector:@selector(showNothing)], "v@:");
        return YES;
    }
    return [super resolveClassMethod:sel];
}
// 消息转发
- (id)forwardingTargetForSelector:(SEL)aSelector {
    // 给对象发出错误消息时，抛出unrecognized selector 错误前还要走该方法。
    // 可以将未响应的方法传递给其他对象
    // 但是返回值还是有本对象接受
    return nil;
}
@end
