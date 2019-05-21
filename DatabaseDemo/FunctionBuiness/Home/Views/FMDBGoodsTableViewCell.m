//
//  FMDBGoodsTableViewCell.m
//  DatabaseDemo
//
//  Created by miao on 2019/5/10.
//  Copyright © 2019年 miao. All rights reserved.
//

#import "FMDBGoodsTableViewCell.h"
#import "Masonry.h"

@interface FMDBGoodsTableViewCell()

@property (strong, nonatomic) UIImageView *goodsView;
@property (strong, nonatomic) UILabel *titleLab;
@property (strong, nonatomic) UILabel *detailLab;
@property (strong, nonatomic) UILabel *priceLable;
@property (strong, nonatomic) UIButton *collectionBtn;
@property (copy, nonatomic) NSString *goodsID;

@end

@implementation FMDBGoodsTableViewCell

+ (instancetype)goodsTableViewCell:(UITableView *)tableView {
    static NSString *identifier = @"FMDBGoodsTableViewCell";
    FMDBGoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setupSubviews];
        [self p_setupLayouts];
    }
    return self;
}

- (void)p_setupSubviews {
    self.goodsView = [[UIImageView alloc]init];
    self.goodsView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.goodsView];
    self.titleLab = [[UILabel alloc]init];
    [self.contentView addSubview:self.titleLab];
    self.detailLab = [[UILabel alloc]init];
    [self.contentView addSubview:self.detailLab];
    self.priceLable = [[UILabel alloc]init];
    [self.contentView addSubview:self.priceLable];
    self.collectionBtn = [[UIButton alloc]init];
    [self.collectionBtn addTarget:self action:@selector(p_collectionAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.collectionBtn];

}

- (void)p_setupLayouts {
    [self.goodsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10.0);
        make.top.equalTo(self.contentView).offset(5.0);
        make.width.height.mas_equalTo(100);
        make.width.width.mas_equalTo(100);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.goodsView.mas_right).offset(10.0);
        make.top.equalTo(self.goodsView).offset(5.0);
        
    }];
    
    [self.detailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab);
        make.top.equalTo(self.titleLab.mas_bottom).offset(5.0);
        
    }];
    
    [self.priceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab);
        make.bottom.equalTo(self.contentView).offset(-5.0);
    }];
    
    [self.collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10.0);
        make.bottom.equalTo(self.contentView).offset(5.0);
        make.width.mas_equalTo(@50);
        make.height.mas_equalTo(@50);
    }];
}

-(void)setTableViewCellData:(NSDictionary *)dict
{
    self.goodsView.image = [UIImage imageNamed:[dict objectForKey:@"picture"]];
    self.titleLab.text = [dict objectForKey:@"name"];
    self.detailLab.text = [dict objectForKey:@"goodsdescribe"];
    self.priceLable.text = [dict objectForKey:@"price"];
    [self p_collectionWith:[dict objectForKey:@"collection"]];
    self.goodsID = [dict objectForKey:@"id"];
    self.collectionBtn.hidden = self.collectBool;
    
}

-(void)p_collectionWith:(NSString *)collection
{
    if ([collection isEqualToString:@"1"]) {
        [self.collectionBtn setImage:[UIImage imageNamed:@"collection_YES"] forState:UIControlStateNormal];
    }else{
         [self.collectionBtn setImage:[UIImage imageNamed:@"collection_NO"] forState:UIControlStateNormal];
    }
}

-(void)p_collectionAction:(UIButton *)sender{
    UIImage *YESImage = [UIImage imageNamed:@"collection_YES"];
    UIImage *NOImage = [UIImage imageNamed:@"collection_NO"];
    UIImage *states = [sender imageForState:UIControlStateNormal];
    NSString *collection;
    if (states == YESImage) {
      [sender setImage:NOImage forState:UIControlStateNormal];
        collection = @"0";
    }else{
        [sender setImage:YESImage forState:UIControlStateNormal];
        collection = @"1";
    }
    
    self.goodsCellBlock(self.goodsID,collection);
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
