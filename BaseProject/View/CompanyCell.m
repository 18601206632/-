//
//  CompanyCell.m
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CompanyCell.h"

@implementation CompanyCell
- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        _iconIV.backgroundColor=[UIColor greenColor];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.mas_equalTo(0);
            make.right.mas_equalTo(-kWindowW/2);
            make.size.mas_equalTo(CGSizeMake(kWindowW/2, kWindowH/4));
        }];
        _iconIV.clipsToBounds=YES;
    }
    return _iconIV;
}

- (TRImageView *)logoIV {
    if(_logoIV == nil) {
        _logoIV = [[TRImageView alloc] init];
        [self.contentView addSubview:_logoIV];
        [_logoIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(55, 55));
            make.right.mas_equalTo(-53);
            make.top.mas_equalTo(20);
            
        }];
        _logoIV.layer.cornerRadius=55/2;
    }
    return _logoIV;
}

- (UILabel *)companyLb {
    if(_companyLb == nil) {
        _companyLb = [[UILabel alloc] init];
        _companyLb.font=[UIFont systemFontOfSize:16.0];
        _companyLb.textColor=[UIColor lightGrayColor];
        [self.contentView addSubview:_companyLb];
        [_companyLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.logoIV);
            make.top.mas_equalTo(self.logoIV.mas_bottom).mas_equalTo(10);
        }];
    }
    return _companyLb;
}

- (UILabel *)styleLb {
    if(_styleLb == nil) {
        _styleLb = [[UILabel alloc] init];
        _styleLb.font=[UIFont systemFontOfSize:14.0];
        _styleLb.textColor=[UIColor lightGrayColor];
        [self.contentView addSubview:_styleLb];
        [_styleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.companyLb);
            make.top.mas_equalTo(self.companyLb.mas_bottom).mas_equalTo(10);
            
        }];
    }
    return _styleLb;
}

- (UILabel *)priceLb {
    if(_priceLb == nil) {
        _priceLb = [[UILabel alloc] init];
        _priceLb.font=[UIFont systemFontOfSize:14.0];
        _priceLb.textColor=[UIColor greenColor];
        [self.contentView addSubview:_priceLb];
        [_priceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.styleLb);
            make.top.mas_equalTo(self.styleLb.mas_bottom).mas_equalTo(10);
            make.bottom.mas_equalTo(-7);
            
        }];
        _priceLb.text=@"·承接价格：面议·";
    }
    return _priceLb;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
