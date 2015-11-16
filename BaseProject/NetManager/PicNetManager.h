//
//  PicNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
typedef NS_ENUM(NSUInteger, infoType) {
    infoTypeAll,
    infoTypeBedroom,
    infoTypeKitchen,
    infoTypeKidss,
    infoTypeLiving,
    infoTypeDining,
    infoTypeBath,
    infoTypeEntry,
};
@interface PicNetManager : BaseNetManager
+(id)getPicPage:(NSInteger )page type:(infoType )type kCompletionHandle;


@end
