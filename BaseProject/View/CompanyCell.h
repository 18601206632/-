//
//  CompanyCell.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface CompanyCell : UITableViewCell

@property (nonatomic,strong)UIImageView *iconIV;
@property (nonatomic,strong)TRImageView *logoIV;
@property (nonatomic,strong)UILabel *companyLb;
@property (nonatomic,strong)UILabel *styleLb;
@property (nonatomic,strong)UILabel *priceLb;

@end
