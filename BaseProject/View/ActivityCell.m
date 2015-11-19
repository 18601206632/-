//
//  ActivityCell.m
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ActivityCell.h"
#import "applyViewController.h"
@implementation ActivityCell
- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font=[UIFont systemFontOfSize:18.0];
        _titleLb.numberOfLines=1;
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.iconIv);
            make.left.mas_equalTo(self.iconIv.mas_bottom).mas_equalTo(10);
            make.right.mas_equalTo(-55);
            
        }];
    }
    return _titleLb;
}

- (UILabel *)timeLb {
    if(_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        _titleLb.font=[UIFont systemFontOfSize:16.0];
        [self.contentView addSubview:_timeLb];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(5);
            make.right.mas_equalTo(-30);
        }];
    }
    return _timeLb;
}

- (UILabel *)areaDetail {
    if(_areaDetail == nil) {
        _areaDetail = [[UILabel alloc] init];
        _areaDetail.font=[UIFont systemFontOfSize:16.0];
        _areaDetail.textColor=[UIColor lightGrayColor];
        [self.contentView addSubview:_areaDetail];
        [_areaDetail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb);
            make.top.mas_equalTo(self.timeLb.mas_bottom).mas_equalTo(5);
            make.bottom.mas_equalTo(-10);
            make.right.mas_equalTo(-55);
        }];
    }
    return _areaDetail;
}

- (UIImageView *)iconIv {
    if(_iconIv == nil) {
        _iconIv = [[UIImageView alloc] init];
        _iconIv.contentMode=UIViewContentModeScaleToFill;
        _iconIv.layer.cornerRadius=5;
        [self.contentView addSubview:_iconIv];
        [_iconIv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(70, 70));
            make.left.top.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
        }];
        _iconIv.clipsToBounds=YES;
    }
    return _iconIv;
}
//- (UILabel *)attendLb {
//    if(_attendLb == nil) {
//        _attendLb = [[UILabel alloc] init];
//        _attendLb.textColor=[UIColor greenColor];
//        _attendLb.font=[UIFont systemFontOfSize:16.0];
//        [self.contentView addSubview:_attendLb];
//        [_attendLb mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(-10);
//            make.bottomMargin.mas_equalTo(self.iconIv);
//        }];
//    }
//    return _attendLb;
//}
-(UIButton *)attendBtn
{
    if (_attendBtn==nil) {
        _attendBtn=[UIButton buttonWithType:(UIButtonTypeCustom)];
        [_attendBtn setBackgroundImage:[UIImage imageNamed:@"activity-Register"] forState:(UIControlStateNormal)];
        [self.contentView addSubview:_attendBtn];
        [_attendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.bottomMargin.mas_equalTo(self.iconIv);
        }];
        
    }
    return _attendBtn;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
