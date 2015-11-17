//
//  TuijianDetailViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TuijianModel.h"
#import "iCarousel.h"
@interface TuijianDetailViewController : UIViewController
@property (nonatomic,strong)TuijianModel *Model;
-(instancetype)initWithTuijianModel:(TuijianModel *)model;
@end
