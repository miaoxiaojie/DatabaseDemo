//
//  FMViewController.m
//  FMDBDemo
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMViewController.h"
#import "CarViewController.h"
#import "FMDBGoodsDBHelperInterface.h"
#import "FMDBHomeFactory.h"
#import "FMDBGoodsList.h"
#import "FMDBGoodsTableViewCell.h"
@interface FMViewController ()<UITableViewDelegate,UITableViewDataSource>

/**
 *  数据源
 */
@property (nonatomic, strong)NSMutableArray<NSDictionary *>* list;

/**
数据库
 */
@property (strong,nonatomic) id<FMDBGoodsDBHelperInterface> dbHelper;

@end

@implementation FMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self replaceGoodsList];
    self.navigationItem.title = @"navigationItem";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(p_addData)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"我的收藏" style:UIBarButtonItemStylePlain target:self action:@selector(p_collection)];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.rowHeight = 110;
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FMDBGoodsTableViewCell *cell = [FMDBGoodsTableViewCell goodsTableViewCell:tableView];
    cell.collectBool = NO;
    [cell setTableViewCellData:[self.list objectAtIndex:indexPath.row]];
    [cell setGoodsCellBlock:^(NSString * _Nonnull goodsID, NSString * _Nonnull collection) {
        [self.dbHelper updateGoodsWithID:goodsID withCollection:collection];
        
    }];
    return cell;
}

/**
 *  设置删除按钮
 *
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
      if (editingStyle == UITableViewCellEditingStyleDelete){
          
          if (self.list.count == 1) {
              UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警  告" message:@"这是最后一个商品不能删除" preferredStyle:UIAlertControllerStyleAlert];
              UIAlertAction *centain = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
              [alert addAction:centain];
              [self presentViewController:alert animated:YES completion:nil];
              return ;
          }
          NSDictionary *dict = self.list[indexPath.row];
          NSString *goodsID = [dict objectForKey:@"id"];
          [self.dbHelper deleteGoodsWithID:goodsID];
          [self.list removeObject:dict];
          [self.tableView reloadData];
          
      }
}

-(void)replaceGoodsList
{
    NSArray *listData = [FMDBGoodsList getGoodsList];
    if ([self.dbHelper deleteAllAdInfos])
    {
        [self.dbHelper replaceGoodsListInfos:listData];
    }
    self.list = [[NSMutableArray alloc] initWithArray:[self.dbHelper selectAllAdInfos]];;
    [self.tableView reloadData];
    
}

- (void)p_collection{
    
    CarViewController *carVc = [[CarViewController alloc] init];
    [carVc setData:[self.dbHelper selectInfosCollect]];
    [self.navigationController pushViewController:carVc animated:YES];
}

/**
 *  添加数据到数据库
 */
- (void)p_addData{
    
    [self.dbHelper insertGoodsListInfos:[FMDBGoodsList getInsertDict]];
    [self.list addObject:[FMDBGoodsList getInsertDict]];
    [self.tableView reloadData];
}

#pragma mark - Getter
- (NSMutableArray *)list{
    if (!_list) {
        _list = [[NSMutableArray alloc] init];
        
    }
    return _list;
    
}
- (id<FMDBGoodsDBHelperInterface>)dbHelper
{
    if (!_dbHelper)
    {
        _dbHelper = [FMDBHomeFactory getGoodsListDBHelper];
    }
    return _dbHelper;
}

@end
