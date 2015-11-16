//
//  PicNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "PicNetManager.h"
#import "PicModel.h"
@implementation PicNetManager
+(id)getPicPage:(NSInteger )page type:(infoType )type kCompletionHandle
{
    NSString *path=@"http://ihome.cmfmobile.com:8080/sp/custom/searchpic.do?";
    NSMutableDictionary *params=[NSMutableDictionary dictionaryWithDictionary:@{@"pn":@(page)}];
    switch (type) {
        case infoTypeAll: {
            [params setObject:@"all" forKey:@"type"];
            break;
        }
        case infoTypeBedroom: {
            [params setObject:@"bedroom" forKey:@"type"];
            break;
        }
        case infoTypeKitchen: {
            [params setObject:@"kitchen" forKey:@"type"];
            break;
        }
        case infoTypeKidss: {
            [params setObject:@"kidss" forKey:@"type"];
            break;
        }
        case infoTypeLiving: {
            [params setObject:@"living" forKey:@"type"];
            break;
        }
        case infoTypeDining: {
            [params setObject:@"dining" forKey:@"type"];
            break;
        }
        case infoTypeBath: {
            [params setObject:@"bath" forKey:@"type"];
            break;
        }
        case infoTypeEntry: {
            [params setObject:@"entry" forKey:@"type"];
            break;
        }
        default: {
            break;
        }
    }
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([PicModel objectArrayWithKeyValuesArray:responseObj],error);
    }];
}


@end
