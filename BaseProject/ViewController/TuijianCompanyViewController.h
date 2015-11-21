//
//  TuijianCompanyViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TuijianDetailModel.h"
@interface TuijianCompanyViewController : UIViewController
@property (nonatomic,strong)TuijianDetailCompanylistModel *model;
-(instancetype)initWithModel:(TuijianDetailCompanylistModel *)model;
@end
