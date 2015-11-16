//
//  TuijianViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuijianNetManager.h"
@interface TuijianViewModel : BaseViewModel
@property (nonatomic)NSInteger rowNumber;
//@property (nonatomic,strong)NSMutableArray *imageUrls;
-(NSString *)nameForRow:(NSInteger )row;
-(NSString *)priceForRow:(NSInteger )row;
-(NSString *)styleForRow:(NSInteger )row;
-(NSString *)spaceForRow:(NSInteger )row;
-(NSString *)priceIncludeForRow:(NSInteger )row;
-(NSArray *)imageurlForRow:(NSInteger )row;
@property (nonatomic)NSInteger page;


@end
