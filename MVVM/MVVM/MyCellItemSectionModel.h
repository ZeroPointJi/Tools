//
//  MyCellItemSectionModel.h
//  MVVM
//
//  Created by zero on 16/4/28.
//  Copyright © 2016年 zero. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyCellItemSectionModel : NSObject

@property (nonatomic, strong) NSArray *itemArray;
@property (nonatomic, copy) NSString *sectionName;
@property (nonatomic, assign) CGFloat sectionHeaderHeight;

@end
