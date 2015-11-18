//
//  ActivityDetailViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"
@interface ActivityDetailViewController : UIViewController
@property (nonatomic,strong)ActivityModel *model;
-(instancetype)initWithModel:(ActivityModel *)model;
@end
