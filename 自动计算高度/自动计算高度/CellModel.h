//
//  CellModel.h
//  自动计算高度
//
//  Created by xrh on 2017/10/23.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellModel : NSObject

@property (nonatomic ,copy) NSString *text;
@property (nonatomic ,copy) NSString *icon;
@property (nonatomic,copy) NSString *name;
@property (nonatomic ,copy) NSString *picture;
@property (nonatomic, assign) BOOL vip;


@property (nonatomic,copy) NSString *picW;
@property (nonatomic,copy) NSString *picH;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)modelWithDict:(NSDictionary *)dict;

@end
