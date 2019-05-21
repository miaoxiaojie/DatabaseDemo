//
//  DBQViewController.m
//  FMDB_CM
//
//  Created by miao on 2019/5/9.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "DBQViewController.h"
#import "FMDBGoodsDBHelperInterface.h"
#import "FMDBHomeFactory.h"

@interface DBQViewController ()<UITableViewDelegate,UITableViewDataSource>

/**
 *  数据源
 */
@property (nonatomic,strong) NSArray *dataArray;
/**
 数据库
 */
@property (nonatomic,strong) id<FMDBGoodsDBHelperInterface> dbHelper;

@end

@implementation DBQViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.tableView.tableFooterView = [[UIView alloc] init];
    self.dataArray = [self.dbHelper selectAllAdInfos];
    [self.tableView reloadData];
}



#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"personcarscell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"personcarscell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    NSDictionary *dict = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [dict objectForKey:@"name"];
    return cell;
    
}

#pragma mark - Getter
- (NSArray *)dataArray{
    
    if (!_dataArray) {
        _dataArray = [[NSArray alloc] init];
        
    }
    return _dataArray;
    
}
- (id<FMDBGoodsDBHelperInterface>)dbHelper
{
    if (!_dbHelper)
    {
        _dbHelper = [FMDBHomeFactory getCityDBHelper];
    }
    return _dbHelper;
}

@end
