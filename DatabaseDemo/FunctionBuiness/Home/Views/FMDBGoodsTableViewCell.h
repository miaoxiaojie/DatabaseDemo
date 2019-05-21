//
//  FMDBGoodsTableViewCell.h
//  DatabaseDemo
//
//  Created by miao on 2019/5/10.
//  Copyright © 2019年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FMDBGoodsTableViewCell : UITableViewCell

+ (instancetype)goodsTableViewCell:(UITableView *)tableView;
-(void)setTableViewCellData:(NSDictionary *)dict;
@property (nonatomic, copy) void  (^goodsCellBlock)(NSString *goodsID,NSString *collection);
@property (nonatomic,assign) BOOL collectBool;

@end

NS_ASSUME_NONNULL_END
