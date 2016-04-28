//
//  MyCellItemModel.h
//  MVVM
//
//  Created by zero on 16/4/28.
//  Copyright © 2016年 zero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MyCellItemType)
{
    MyCellItemTypeSystem,
    MyCellItemTypeSwitch
};

@interface MyCellItemModel : NSObject

@property (nonatomic, copy) NSString *itemName; // 左边的label
@property (nonatomic, strong) UIImage *itemImage; // 左边的图片
@property (nonatomic, copy) NSString *detailName; // 右边的label
@property (nonatomic, strong) UIImage *detailImage; // 右边的图片
@property (nonatomic, copy) void (^SwitchValueChanged)(BOOL isOn); // 开关变化时执行的回调
@property (nonatomic, copy) void (^ClickItemOperation)(); // 点击 Item 执行的回调

@property (nonatomic, assign) MyCellItemType type; // cell 类型

@end
