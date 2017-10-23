//
//  WLCell.h
//  自动计算高度
//
//  Created by xrh on 2017/10/23.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CellFrameModel;

@interface WLCell : UITableViewCell

@property(strong, nonatomic) CellFrameModel *modelFrame;

- (void)showCellWithModel:(CellFrameModel *)frameModel indexPath:(NSIndexPath *)indexPath;

@end
