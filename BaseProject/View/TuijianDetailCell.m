//
//  TuijianDetailCell.m
//  BaseProject
//
//  Created by hanbo on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuijianDetailCell.h"

@implementation TuijianDetailCell
- (UIImageView *)iconIv {
    if(_iconIv == nil) {
        _iconIv = [[UIImageView alloc] initWithFrame:CGRectZero];
        _iconIv.layer.cornerRadius=60/2;
        [self.contentView addSubview:_iconIv];
        [_iconIv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(60, 60));
        }];
        _iconIv.clipsToBounds=YES;
        
    }
    return _iconIv;
}

- (UILabel *)companyNameLb {
    if(_companyNameLb == nil) {
        _companyNameLb = [[UILabel alloc] init];
        _companyNameLb.font=[UIFont systemFontOfSize:18.0];
        _companyNameLb.textAlignment=UITextAlignmentCenter;
        [self.contentView addSubview:_companyNameLb];
        [_companyNameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.iconIv.mas_bottom).mas_equalTo(20);
            make.centerX.mas_equalTo(0);
            
        }];
    }
    return _companyNameLb;
}

- (UILabel *)areaDetailLb {
    if(_areaDetailLb == nil) {
        _areaDetailLb = [[UILabel alloc] init];
        _areaDetailLb.textAlignment=UITextAlignmentCenter;
        _areaDetailLb.font=[UIFont systemFontOfSize:14.0];
        [self.contentView addSubview:_areaDetailLb];
        [_areaDetailLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.companyNameLb.mas_bottom).mas_equalTo(20);
            make.centerX.mas_equalTo(0);
            make.bottom.mas_equalTo(-10);
        }];
    }
    return _areaDetailLb;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
