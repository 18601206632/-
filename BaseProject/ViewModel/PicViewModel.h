//
//  PicViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "PicNetManager.h"

@interface PicViewModel : BaseViewModel
-(instancetype)initWithType:(infoType)type;
@property (nonatomic) NSInteger rowNumber;
-(NSURL *)iconForRow:(NSInteger)row;
@property (nonatomic) NSInteger page;
@property (nonatomic) infoType type;
@end
