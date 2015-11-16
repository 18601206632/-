//
//  LingganCell.m
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LingganCell.h"

@implementation LingganCell
- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font=[UIFont systemFontOfSize:18.0];
        _titleLb.textColor=[UIColor greenColor];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.iconIv);
            make.left.mas_equalTo(self.iconIv.mas_right).mas_equalTo(5);
        }];
    }
    return _titleLb;
}

- (UILabel *)updateTimeLb {
    if(_updateTimeLb == nil) {
        _updateTimeLb = [[UILabel alloc] init];
        _updateTimeLb.font=[UIFont systemFontOfSize:16.0];
        _updateTimeLb.textColor=[UIColor lightGrayColor];
        [self.contentView addSubview:_updateTimeLb];
        [_updateTimeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(5);
        }];
    }
    return _updateTimeLb;
}



- (UILabel *)introductionLb {
    if(_introductionLb == nil) {
        _introductionLb = [[UILabel alloc] init];
        _introductionLb.font=[UIFont systemFontOfSize:16.0];
        _introductionLb.textColor=[UIColor lightGrayColor];
        [self.contentView addSubview:_introductionLb];
        [_introductionLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb);
            make.top.mas_equalTo(self.updateTimeLb.mas_bottom).mas_equalTo(5);
            make.right.mas_equalTo(30);
        }];
    }
    return _introductionLb;
}

- (UIImageView *)iconIv {
    if(_iconIv == nil) {
        _iconIv = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIv];
        [_iconIv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(80, 80));
        }];
    }
    return _iconIv;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
