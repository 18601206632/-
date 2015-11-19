//
//  ActivityCell.h
//  BaseProject
//
//  Created by tarena on 15/11/16.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityCell : UITableViewCell
@property (nonatomic,strong)UILabel *titleLb;
@property (nonatomic,strong)UILabel *timeLb;
@property (nonatomic,strong)UILabel *areaDetail;
@property (nonatomic,strong)UIImageView *iconIv;
//@property (nonatomic,strong)UILabel *attendLb;
@property (nonatomic,strong)UIButton *attendBtn;

@end
