//
//  MyCustomTableViewCell.m
//  MVVM
//
//  Created by zero on 16/4/28.
//  Copyright © 2016年 zero. All rights reserved.
//

#import "MyCustomTableViewCell.h"
#import "MyCellItemModel.h"
#import "UIView+JLKEazyFrameSet.h"

#define kImgToLeft 10
#define kIndicatorToRight 10
#define kLabelToImg 5
#define kDetailViewToIndicator 13
#define kSCreenWidth [UIScreen mainScreen].bounds.size.width

@interface MyCustomTableViewCell()

@property (nonatomic, strong) UIImageView *itemImage;
@property (nonatomic, strong) UIImageView *detailImage;
@property (nonatomic, strong) UIImageView *indicatorImage;
@property (nonatomic, strong) UILabel *itemLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UISwitch *aSwitch;

@end

@implementation MyCustomTableViewCell

- (UISwitch *)aSwitch
{
    if (!_aSwitch) {
        self.aSwitch = [[UISwitch alloc] init];
        _aSwitch.x = kSCreenWidth - _aSwitch.width - kIndicatorToRight;
        _aSwitch.centerY = self.contentView.centerY;
        [_aSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _aSwitch;
}

- (void)switchValueChanged:(UISwitch *)aswitch
{
    if (self.item.SwitchValueChanged) {
        self.item.SwitchValueChanged(aswitch.isOn);
    }
}

- (UIImageView *)indicatorImage
{
    if (!_indicatorImage) {
        self.indicatorImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-arrow1"]];
        _indicatorImage.x = kSCreenWidth - _indicatorImage.width - kIndicatorToRight;
        _indicatorImage.centerY = self.contentView.centerY;
    }
    return _indicatorImage;
}

- (void)setItem:(MyCellItemModel *)item
{
    _item = item;
    
    // 设置 UI
    [self setupUI];
}

- (void)setupUI
{
    // 1. 清空
    // SEL 就是 @selector, 实际上就是 C 语言字符串
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    // 2. 布局
    if (self.item.itemImage) {
        // 设置 itemImage
        [self setupItemImage];
    }
    if (self.item.itemName) {
        // 设置 itemName
        [self setupItemName];
    }
    
    // 设置样式
    switch (self.item.type) {
        case MyCellItemTypeSystem:
        [self setupTypeSystem];
            break;
        case MyCellItemTypeSwitch:
            [self setupTypeSwitch];
            break;
        default:
            break;
    }
    
    if (self.item.detailName) {
        // 设置 detailName
        [self setupDetailName];
    }
    if (self.item.detailImage) {
        // 设置 detailImage
        [self setupDetailImage];
    }
    
    UIView *line = [[UIView alloc] init];
    line.y = self.contentView.height - 1;
    line.width = kSCreenWidth;
    line.height = 1;
    line.backgroundColor = [UIColor darkGrayColor];
    line.alpha = .05f;
    [self.contentView addSubview:line];
}

// 设置 itemImage
- (void)setupItemImage
{
    self.itemImage = [[UIImageView alloc] initWithImage:self.item.itemImage];
    _itemImage.x = kImgToLeft;
    _itemImage.centerY = self.contentView.centerY;
    [self.contentView addSubview:_itemImage];
}

// 设置 itemName
- (void)setupItemName
{
    self.itemLabel = [[UILabel alloc] init];
    _itemLabel.text = self.item.itemName;
    _itemLabel.font = [UIFont systemFontOfSize:14];
    _itemLabel.size = [_itemLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:0 attributes:@{NSFontAttributeName : _itemLabel.font} context:nil].size;
    _itemLabel.x = kImgToLeft + CGRectGetMaxX(self.itemImage.frame);
    _itemLabel.centerY = self.contentView.centerY;
    [self.contentView addSubview:_itemLabel];
}

// 设置 detailName
- (void)setupDetailName
{
    self.detailLabel = [[UILabel alloc] init];
    _detailLabel.text = self.item.detailName;
    _detailLabel.font = [UIFont systemFontOfSize:14];
    _detailLabel.size = [_detailLabel.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:0 attributes:@{NSFontAttributeName : _detailLabel.font} context:nil].size;
    switch (self.item.type) {
        case MyCellItemTypeSystem:
            self.detailLabel.x = self.indicatorImage.x - self.detailLabel.width - kDetailViewToIndicator;
            break;
        case MyCellItemTypeSwitch:
            self.detailLabel.x = self.aSwitch.x - self.detailLabel.width - kDetailViewToIndicator;
            break;
        default:
            break;
    }
    _detailLabel.centerY = self.contentView.centerY;
    [self.contentView addSubview:_detailLabel];
}

// 设置 detailImage
- (void)setupDetailImage
{
    self.detailImage = [[UIImageView alloc] initWithImage:self.item.detailImage];
    switch (self.item.type) {
        case MyCellItemTypeSystem:
            self.detailImage.x = self.indicatorImage.x - self.detailImage.width - kDetailViewToIndicator;
            break;
        case MyCellItemTypeSwitch:
            self.detailImage.x = self.aSwitch.x - self.detailImage.width - kDetailViewToIndicator;
            break;
        default:
            break;
    }
    _detailImage.centerY = self.contentView.centerY;
    [self.contentView addSubview:_detailImage];
}

// 设置 type 为 System
- (void)setupTypeSystem
{
    [self.contentView addSubview:self.indicatorImage];
}

// 设置 type 为 Switch
- (void)setupTypeSwitch
{
    [self.contentView addSubview:self.aSwitch];
}

@end
