//
//  companyNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "companyModel.h"
@interface companyNetManager : BaseNetManager
+(id)getcompanyCity:(NSString *)city page:(NSInteger)page kCompletionHandle;


@end
