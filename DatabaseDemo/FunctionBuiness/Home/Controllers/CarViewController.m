//
//  CarViewController.m
//  FMDBDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "CarViewController.h"
#import "FMDBGoodsTableViewCell.h"

@interface CarViewController ()

/**
 数据源
 */
@property(nonatomic,strong) NSArray <NSDictionary *>* dataArray;

@end

@implementation CarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"收藏";
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.rowHeight = 100;
  
}

-(void)setData:(NSArray <NSDictionary *>* )list
{
    self.dataArray = list;
    [self.tableView reloadData];
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
   return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FMDBGoodsTableViewCell *cell = [FMDBGoodsTableViewCell goodsTableViewCell:tableView];
    cell.collectBool = YES;
    [cell setTableViewCellData:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
    
}

@end
