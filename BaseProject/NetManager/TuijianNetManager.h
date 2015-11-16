//
//  TuijianNetModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TuijianModel.h"
#import "ActivityModel.h"
#import "lingganModel.h"
@interface TuijianNetManager : BaseNetManager
+(id)getPage:(NSInteger)page kCompletionHandle;
+(id)getActivityWithPage:(NSInteger)Page kCompletionHandle;
+(id)getLingganWithPage:(NSInteger)Page kCompletionHandle;
@end
