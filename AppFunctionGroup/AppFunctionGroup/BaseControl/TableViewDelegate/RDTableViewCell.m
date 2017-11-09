//
//  RDTableViewCell.m
//  AppFunctionGroup
//
//  Created by yang song on 09/11/2017.
//  Copyright © 2017 yangsong. All rights reserved.
//

#import "RDTableViewCell.h"

@implementation RDTableViewCell
/**
 配置数据

 @param dataDic 数据字典
 */
- (void)configedWithData: (NSString *)dataDic {
    self.textLabel.text = dataDic;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
