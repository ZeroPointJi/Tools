//
//  MyCustomTableViewCell.h
//  MVVM
//
//  Created by zero on 16/4/28.
//  Copyright © 2016年 zero. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyCellItemModel;

@interface MyCustomTableViewCell : UITableViewCell

@property (nonatomic, strong) MyCellItemModel *item;

@end
