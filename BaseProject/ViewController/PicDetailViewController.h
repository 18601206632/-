//
//  PicDetailViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PicDetailViewController : UIViewController
@property (nonatomic,strong)NSNumber *infoType;
-(id)initWithType:(NSNumber *)infoType;
@property (nonatomic,strong )NSArray *images;
@end
