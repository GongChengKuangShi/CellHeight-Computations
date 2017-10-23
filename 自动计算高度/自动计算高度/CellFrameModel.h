//
//  CellFrameModel.h
//  自动计算高度
//
//  Created by xrh on 2017/10/23.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CellModel.h"

@interface CellFrameModel : NSObject

@property (nonatomic, assign, readonly) CGRect iconF;
@property (nonatomic, assign,readonly) CGRect nameF;
@property (nonatomic,assign,readonly) CGRect textF;
@property (nonatomic,assign,readonly) CGRect pictureF;

@property (nonatomic,assign,readonly) CGFloat cellHeight;
@property (nonatomic,strong) CellModel *cellModel;

@end
