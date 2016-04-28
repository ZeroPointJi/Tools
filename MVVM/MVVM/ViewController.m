//
//  ViewController.m
//  MVVM
//
//  Created by zero on 16/4/28.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "ViewController.h"
#import "MyCellItemModel.h"
#import "MyCellItemSectionModel.h"
#import "MyCustomTableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation ViewController

- (NSArray *)dataArr
{
    if (!_dataArr) {
        self.dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建 tableview
    [self setupTableView];
    
    // 创建model
    // 1.
    MyCellItemModel *item1 = [[MyCellItemModel alloc] init];
    item1.itemName = @"任务1";
    item1.itemImage = [UIImage imageNamed:@"icon-list01"];
    item1.ClickItemOperation = ^{
        NSLog(@"点击了任务1");
    };
    item1.type = MyCellItemTypeSystem;
    item1.detailName = @"赚金币";
    
    // 2.
    MyCellItemModel *item2 = [[MyCellItemModel alloc] init];
    item2.itemName = @"任务2";
    item2.itemImage = [UIImage imageNamed:@"icon-list01"];
    item2.ClickItemOperation = ^{
        NSLog(@"点击了任务2");
    };
    item2.type = MyCellItemTypeSystem;
    item2.detailImage = [UIImage imageNamed:@"icon-new"];
    
    // 3.
    MyCellItemModel *item3 = [[MyCellItemModel alloc] init];
    item3.itemName = @"任务3";
    item3.itemImage = [UIImage imageNamed:@"icon-list01"];
    item3.ClickItemOperation = ^{
        NSLog(@"点击了任务3");
    };
    item3.type = MyCellItemTypeSwitch;
    item3.SwitchValueChanged = ^(BOOL isOn) {
        NSLog(@"开关~~~~~%d", isOn);
    };
    
    MyCellItemSectionModel *sm = [[MyCellItemSectionModel alloc] init];
    sm.itemArray = @[item1, item2, item3];
    sm.sectionHeaderHeight = 20;
    
    // 4.
    MyCellItemModel *item4 = [[MyCellItemModel alloc] init];
    item4.itemName = @"任务4";
    item4.itemImage = [UIImage imageNamed:@"icon-list01"];
    item4.ClickItemOperation = ^{
        NSLog(@"点击了任务4");
    };
    item4.type = MyCellItemTypeSystem;
    item4.detailName = @"赚金币";
    
    MyCellItemSectionModel *sm2 = [[MyCellItemSectionModel alloc] init];
    sm2.itemArray = @[item4];
    sm2.sectionHeaderHeight = 40;
    
    self.dataArr = @[sm, sm2];
}

- (void)setupTableView
{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = [UIScreen mainScreen].bounds;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    [self.view addSubview:tableView];
}

#pragma mark - TableView Delegate & DataSource -
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return [self.dataArr[section] sectionHeaderHeight];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    MyCellItemSectionModel *sm = self.dataArr[section];
    return sm.itemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"reuse";
    MyCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MyCustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    // 去模型
    MyCellItemSectionModel *sm = self.dataArr[indexPath.section];
    MyCellItemModel *item = sm.itemArray[indexPath.row];
    cell.item = item;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCellItemSectionModel *sm = self.dataArr[indexPath.section];
    MyCellItemModel *item = sm.itemArray[indexPath.row];
    item.ClickItemOperation();
}

@end