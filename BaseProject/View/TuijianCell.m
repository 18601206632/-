//
//  TuijianCell.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuijianCell.h"


@implementation TuijianCell
- (UIView *)yellowView {
    if(_yellowView == nil) {
        _yellowView = [[UIView alloc] init];
        _yellowView.backgroundColor=[UIColor yellowColor];
        [self.contentView addSubview:_yellowView];
        
        
    }
    return _yellowView;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font=[UIFont systemFontOfSize:18.0];
        [self.contentView addSubview:_titleLb];
            }
    return _titleLb;
}

- (UILabel *)styleLb {
    if(_styleLb == nil) {
        _styleLb = [[UILabel alloc] init];
        _styleLb.font=[UIFont systemFontOfSize:16.0];
        _styleLb.textColor=[UIColor lightGrayColor];
        [self.contentView addSubview:_styleLb];
        

    }
    return _styleLb;
}

- (UIView *)greenView {
    if(_greenView == nil) {
        _greenView = [[UIView alloc] init];
        _greenView.backgroundColor=[UIColor greenColor];
        [self.contentView addSubview:_greenView];
        
    }
    return _greenView;
}

- (UILabel *)priceLb {
    if(_priceLb == nil) {
        _priceLb = [[UILabel alloc] init];
        _priceLb.font=[UIFont boldSystemFontOfSize:22.0];
        _priceLb.textColor=[UIColor whiteColor];
        _priceLb.textAlignment=NSTextAlignmentCenter;
        [self.greenView addSubview:_priceLb];
        
    }
    return _priceLb;
}

- (UILabel *)includeLb {
    if(_includeLb == nil) {
        _includeLb = [[UILabel alloc] init];
        _includeLb.font=[UIFont systemFontOfSize:15.0];
        _includeLb.textColor=[UIColor whiteColor];
        _includeLb.textAlignment=NSTextAlignmentCenter;
        [self.greenView addSubview:_includeLb];
    }
    return _includeLb;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        [self.yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.left.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(kWindowW, 180));
        }];
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(13);
            make.top.mas_equalTo(self.yellowView.mas_bottom).mas_equalTo(10);
            make.right.mas_equalTo(self.greenView.mas_left).mas_equalTo(-50);
//            make.bottom.mas_equalTo(self.styleLb.mas_top).mas_equalTo(8);
        }];
        [self.styleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin).mas_equalTo(0);
            make.rightMargin.mas_equalTo(self.titleLb.mas_rightMargin).mas_equalTo(0);
            make.bottom.mas_equalTo(-8);
        }];
        [self.greenView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 50));
            make.bottom.mas_equalTo(-20);
            make.right.mas_equalTo(-10);
        }];
        [self.priceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.mas_equalTo(0);
            make.top.mas_equalTo(13);
            make.bottom.mas_equalTo(self.includeLb.mas_top).mas_equalTo(-2);
            
        }];
        [self.includeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-5);
            make.right.left.mas_equalTo(0);
        }];
        
        
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
