//
//  MyView.m
//  UIViewAndSubviews
//
//  Created by yang song on 06/11/2017.
//  Copyright © 2017 yangsong. All rights reserved.
//

#import "MyView.h"

@implementation MyView

#pragma mark - 绘制   rendering
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSLog(@"draw rect");
}
- (void)setNeedsDisplay {
        NSLog(@"setNeedsDisplay");
}
- (void)setNeedsDisplayInRect:(CGRect)rect {
    NSLog(@"setNeedsDisplayInRect");
}

#pragma mark - 层级   hirarchy
- (void)layoutSubviews {
    NSLog(@"layoutSubviews");
}
- (void)setNeedsLayout {
    NSLog(@"setNeedsLayout");
}
- (void)layoutIfNeeded {
    NSLog(@"layoutIfNeeded");
}

#pragma mark - 几何  geometry
/**
 calls sizeThatFits: with current view bounds and changes bounds size.
 */
- (void)sizeToFit {
    NSLog(@"sizeToFit");
}
/**
return 'best' size to fit given size. does not actually resize view. Default is return existing view size

 @param size 给定大小
 @return 返回适应大小
 */
- (CGSize)sizeThatFits:(CGSize)size {
    NSLog(@"sizeThatFits");
    return [super sizeThatFits:size];
}



@end
