//
//  ViewController.m
//  自动计算高度
//
//  Created by xrh on 2017/10/23.
//  Copyright © 2017年 xrh. All rights reserved.
//

#import "ViewController.h"
#import "CellModel.h"
#import "CellFrameModel.h"
#import "WLCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(strong, nonatomic) NSMutableArray *cellFrames;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self registNotifaction];
}

-(void)registNotifaction
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadCell:) name:@"SelectionViewController" object:nil];
    
}

- (void)reloadCell:(NSNotification *)info {
    
    NSDictionary *dict = info.userInfo;
    NSString *picHeight = [[dict objectForKey:@"Height"] stringValue];
    NSIndexPath *indexpath = [dict objectForKey:@"indexPath"];
    if (self.cellFrames.count >= indexpath.row) {
        CellFrameModel *modelFrame = [self.cellFrames objectAtIndex:indexpath.row];
        modelFrame.cellModel.picH = picHeight;
        modelFrame.cellModel = modelFrame.cellModel;
        [self.cellFrames replaceObjectAtIndex:indexpath.row withObject:modelFrame];
        [self.tableView reloadData];
    }
}

- (NSArray *)cellFrames {
    if (_cellFrames == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"statuses.plist" ofType:nil];
        NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *cellsFrameArray = [[NSMutableArray alloc] init];
        for (NSDictionary *dict in dicArray) {
            CellModel *model = [CellModel modelWithDict:dict];
            CellFrameModel *modelFrame = [[CellFrameModel alloc] init];
            modelFrame.cellModel = model;
            [cellsFrameArray addObject:modelFrame];
        }
        _cellFrames = cellsFrameArray;
    }
    return _cellFrames;
}

#pragma makr -- TableViewDatasuce
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cellFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"cell";
    WLCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[WLCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    else {
        for (UIView *sub in cell.contentView.subviews) {
            if ([sub isKindOfClass:[UIImageView class]]) {
                UIImageView *tempImageView = (UIImageView *)sub;
                tempImageView.image = nil;
            }
            if ([sub isKindOfClass:[UILabel class]]) {
                UILabel *tempUILabel = (UILabel *)sub;
                tempUILabel.text = nil;
            }
        }
    }
    [cell showCellWithModel:self.cellFrames[indexPath.row] indexPath:indexPath];
    return cell;
}

#pragma mark -- TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellFrameModel *cellModel = self.cellFrames[indexPath.row];
    return cellModel.cellHeight;
}

@end
